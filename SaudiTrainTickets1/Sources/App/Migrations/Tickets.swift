import Fluent

// Create Tickets Table
struct CreateTickets: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("tickets")
            .id()
            .field("TicketNumber", .string)
            .field("PassengerID", .uuid, .references("passengers", "id"))
            .field("SeatNumber", .string)
            .create()
    }
    // Undo Function 
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("tickets").delete()
    }
}
