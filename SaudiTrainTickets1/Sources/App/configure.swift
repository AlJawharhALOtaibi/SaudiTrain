import Vapor
import Fluent
import FluentPostgresDriver

public func configure(_ app: Application) async throws {
    // 1. Postgres
    app.databases.use(.postgres(configuration:
                                    SQLPostgresConfiguration(hostname: "localhost",
                                                             username: "aljawharh", password: "",
                                                             database: "sauditrain",
                                                             tls:.prefer(try .init(configuration: .clientDefault)))),     as: .psql)
    
   
    try routes(app)
    
    
    
    //2. Migrations
    app.migrations.add(CreatePassengers())
    app.migrations.add(CreateTickets())
    app.migrations.add(CreateTrainSchedules())
    try await app.autoMigrate()
    
}

