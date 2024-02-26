import Fluent

// Create TrainSchedules Table
struct CreateTrainSchedules: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("train_schedules")
            .id()
            .field("ScheduleID", .int)
            .field("TrainNumber", .string)
            .field("ArrivalStation", .string)
            .field("ArrivalDate", .datetime)
            .create()
    }
    // Undo Function 
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("train_schedules").delete()
    }
}
