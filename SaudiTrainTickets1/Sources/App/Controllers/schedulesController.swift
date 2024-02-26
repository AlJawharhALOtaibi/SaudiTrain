//
//  File.swift
//  
//
//  Created by AlJawharh AlOtaibi on 15/08/1445 AH.
//

import Foundation
import Vapor

struct schedulesController: RouteCollection {
    
    func boot(routes: Vapor.RoutesBuilder) throws{
        
        let schedules = routes.grouped("train_schedule")
        schedules.get(use: getAllSchedules)
        schedules.get(":id", use: getScheduleByID)
        schedules.put(":id", use: updateScheduleByID)
        schedules.delete(":id", use: deleteScheduleByID)
        
    }
    
}


//MARK: - TrainSchedule


func getAllSchedules(req: Request) throws -> EventLoopFuture<[TrainSchedule]> {
    return TrainSchedule.query(on: req.db).all()
}

func getScheduleByID(req: Request) throws -> EventLoopFuture<TrainSchedule> {
    guard let scheduleID = req.parameters.get("scheduleID", as: UUID.self) else {
        throw Abort(.badRequest)
    }
    return TrainSchedule.find(scheduleID, on: req.db)
        .unwrap(or: Abort(.notFound))
}

func deleteScheduleByID(req: Request) throws -> EventLoopFuture<HTTPStatus> {
    guard let scheduleID = req.parameters.get("scheduleID", as: UUID.self) else {
        throw Abort(.badRequest)
    }
    return TrainSchedule.find(scheduleID, on: req.db)
        .unwrap(or: Abort(.notFound))
        .flatMap { schedule in
            return schedule.delete(on: req.db)
                .transform(to: .ok)
        }
}

func updateScheduleByID(req: Request) throws -> EventLoopFuture<TrainSchedule> {
    guard let scheduleID = req.parameters.get("scheduleID", as: UUID.self) else {
        throw Abort(.badRequest)
    }
    let updatedSchedule = try req.content.decode(TrainSchedule.self)
    return TrainSchedule.find(scheduleID, on: req.db)
        .unwrap(or: Abort(.notFound))
        .flatMap { schedule in
            schedule.trainNumber = updatedSchedule.trainNumber
            schedule.arrivalStation = updatedSchedule.arrivalStation
            schedule.arrivalDate = updatedSchedule.arrivalDate
            return schedule.save(on: req.db)
                .transform(to: schedule)
        }
}
