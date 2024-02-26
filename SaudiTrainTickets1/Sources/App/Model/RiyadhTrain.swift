import Vapor
import Fluent


//MARK: - Passenger

final class Passenger: Model, Content {
    static let schema = "passengers"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "PassengerName")
    var name: String
    
    @Children(for: \.$passenger)
    var ticket: [Ticket]
    
    init() { }
    
    init(id: UUID? = nil, name: String, ticketsID: UUID) {
        self.id = id
        self.name = name
    }
}


//MARK: - Ticket

final class Ticket: Model, Content {
    static let schema = "tickets"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "TicketNumber")
    var ticketNumber: String
    
    @Parent(key: "PassengerID")
    var passenger: Passenger
    
    @Field(key: "SeatNumber")
    var seatNumber: String
    
    init() { }
    
    init(id: UUID? = nil, ticketNumber: String, passengerID: UUID, seatNumber: String) {
        self.id = id
        self.ticketNumber = ticketNumber
        self.seatNumber = seatNumber
        self.$passenger.id = passengerID
    }
}

//MARK: - TrainSchedule

final class TrainSchedule: Model, Content {
    static let schema = "train_schedules"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "ScheduleID")
    var scheduleID: Int
    
    @Field(key: "TrainNumber")
    var trainNumber: String
    
    @Field(key: "ArrivalStation")
    var arrivalStation: String
    
    @Field(key: "ArrivalDate")
    var arrivalDate: Date
    
    init() { }
    
    init(id: UUID? = nil, scheduleID: Int, trainNumber: String, arrivalStation: String, arrivalDate: Date) {
        self.id = id
        self.scheduleID = scheduleID
        self.trainNumber = trainNumber
        self.arrivalStation = arrivalStation
        self.arrivalDate = arrivalDate
    }
}




