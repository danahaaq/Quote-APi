import Fluent
import Vapor

struct authorController: RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        let quote = routes .grouped ("author")
        quote.get (use: index)
        quote.put(use: update)
        quote.delete(":id", use: delete)
        
    }
    //author route
    func index(req: Request) throws -> EventLoopFuture<[Author]> {
        return Author.query(on: req.db).all()
    }
    
    func update(req: Request) async throws -> HTTPStatus {
        let newAuthor = try req.content.decode(Author.self)
        
        guard let quote = try await Author.find(newAuthor.id, on: req.db) else {
            throw Abort(.notFound)
        }
        quote.Author_Name = newAuthor.Author_Name
        try await quote.save(on: req.db)
            return .ok
        
    }
    
    
    //delete
    func delete(req: Request) async throws -> HTTPStatus {
        
        guard let quote = try await Author.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await quote.delete(on: req.db)
        return .ok
    }
}
