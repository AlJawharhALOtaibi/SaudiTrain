
import Vapor

func routes(_ app:Application) throws {
    
    try app.register(collection: passengersController())
    try app.register(collection: ticketController())
    try app.register(collection: schedulesController())
    
}
