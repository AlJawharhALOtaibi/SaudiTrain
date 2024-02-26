//
//  ticketController.swift
//
//
//  Created by AlJawharh AlOtaibi on 15/08/1445 AH.
//

import Foundation
import Vapor

struct ticketController: RouteCollection {
    
    func boot(routes: Vapor.RoutesBuilder) throws{
        
        let ticket = routes.grouped("tickets")
        ticket.post(use: createTicket)
        ticket.get(use: getAllTickets)
        ticket.get(":id", use: getTicketByTicketNum)
        ticket.put(":id", use: updatePassenger)
        ticket.delete(":id", use: deleteTicketByTicketNum)
        
    }
    
}

//MARK: - Ticket

func createTicket(req: Request) throws -> EventLoopFuture<Ticket> {
    let ticket = try req.content.decode(Ticket.self)
    return ticket.save(on: req.db).map { ticket }
}

func getAllTickets(req: Request) throws -> EventLoopFuture<[Ticket]> {
    return Ticket.query(on: req.db).all()
}

func getTicketByTicketNum(req: Request) throws -> EventLoopFuture<Ticket> {
    guard let ticketNumber = req.parameters.get("ticketNumber") else {
        throw Abort(.badRequest)
    }
    return Ticket.query(on: req.db)
        //.filter(\.$ticketNumber == ticketNumber)
        .first()
        .unwrap(or: Abort(.notFound))
}

func deleteTicketByTicketNum(req: Request) throws -> EventLoopFuture<HTTPStatus> {
    guard let ticketNumber = req.parameters.get("ticketNumber") else {
        throw Abort(.badRequest)
    }
    return Ticket.query(on: req.db)
//        .filter(\.$ticketNumber == ticketNumber)
        .delete()
        .transform(to: .ok)
}
