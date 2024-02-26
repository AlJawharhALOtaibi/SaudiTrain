import Fluent

// Create Passengers Table
struct CreatePassengers: Migration {
  
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("passengers")
            .id()
            .field("PassengerName", .string)
            .create()
    }
    
    
    // Undo Function 
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("passengers").delete()
    }
}
