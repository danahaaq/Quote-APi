import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.post("author"){ req -> EventLoopFuture<Author> in
        let s = try req.content.decode(Author.self)
        return s.create(on: req.db).map {s}
    }
    
    try app.register(collection: quoteController())
}
