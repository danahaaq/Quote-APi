import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    app.databases.use(.postgres(hostname: "localhost", username: "postgres", password: "" , database: "quote"), as: .psql)
    // table name createSongs()
    app.migrations.add(CreateQuote())
    // wait means : wait until line 19 run or loading
    try app.autoMigrate().wait()
    // register routes
    try routes(app)
}
