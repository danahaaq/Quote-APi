import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.post("author"){ req -> EventLoopFuture<Author> in
        let qt = try req.content.decode(Author.self)
        return qt.create(on: req.db).map {qt}
    }
    try app.register(collection: authorController())
    
    app.post("Quote"){ req -> EventLoopFuture<Quotee> in
        let qt = try req.content.decode(Quotee.self)
        return qt.create(on: req.db).map {qt}
    }
    
    try app.register(collection: quoteControllerr())
}
