//
//  File.swift
//  
//
//  Created by AlJawharh AlOtaibi on 15/08/1445 AH.
//

import Foundation
import Vapor


//MARK: - Passenger

struct passengersController: RouteCollection {
    
    func boot(routes: Vapor.RoutesBuilder) throws{
        
        let passengers = routes.grouped("passengers")
        passengers.post(use: createPassenger)
        passengers.get(use: getAllPassengers)
        passengers.get(":id", use: getPassengerByID)
        passengers.put(":id", use: updatePassenger)
        passengers.delete(":id", use: deletePassenger)
        
    }
    
}

func createPassenger(req: Request) throws ->  EventLoopFuture<Passenger> {
    let passenger = try req.content.decode(Passenger.self)
    return passenger.create(on: req.db).map { passenger }
}


func getAllPassengers(req: Request) throws -> EventLoopFuture<[Passenger]> {
    return Passenger.query(on: req.db).all()
}

func getPassengerByID(req: Request) throws -> EventLoopFuture<Passenger> {
    guard let passengerID = req.parameters.get("id", as: UUID.self) else {
        throw Abort(.badRequest)
    }
    return Passenger.find(passengerID, on: req.db)
        .unwrap(or: Abort(.notFound))
}


func updatePassenger(req: Request) throws -> EventLoopFuture<Passenger> {
    let passengerID = try req.parameters.require("id", as: UUID.self)
    let updatedPassenger = try req.content.decode(Passenger.self)
    return Passenger.find(passengerID, on: req.db)
        .unwrap(or: Abort(.notFound))
        .flatMap { passenger in
            passenger.name = updatedPassenger.name
            return passenger.save(on: req.db).map { passenger }
        }
}


func deletePassenger(req: Request) throws -> EventLoopFuture<HTTPStatus> {
    let passengerID = try req.parameters.require("id", as: UUID.self)
    return Passenger.find(passengerID, on: req.db)
        .unwrap(or: Abort(.notFound))
        .flatMap { passenger in
            return passenger.delete(on: req.db)
        }
        .transform(to: .ok)
}



