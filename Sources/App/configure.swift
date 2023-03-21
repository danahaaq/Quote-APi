import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    app.databases.use(.postgres(hostname: "localhost", username: "postgres", password: "" , database: "qt"), as: .psql)
    
    app.migrations.add(CreateAuthor())
    app.migrations.add(createQuoteeee2())
    try app.autoMigrate().wait()
    // register routes
    try routes(app)
}
