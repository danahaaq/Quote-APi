import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.post("quote"){ req -> EventLoopFuture<Quote> in
        let s = try req.content.decode(Quote.self)
        return s.create(on: req.db).map {s}
    }
    
    try app.register(collection: quoteController())
}
