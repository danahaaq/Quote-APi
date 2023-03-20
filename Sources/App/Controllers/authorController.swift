import Fluent
import Vapor

struct authorController: RouteCollection {
    //author route
    func boot(routes: Vapor.RoutesBuilder) throws {
        let quote = routes .grouped ("author")
//         call get function
        quote.get (use: index)
//         call update function
        quote.put(use: update)
//         call delete function
        quote.delete(":id", use: delete)
        
    }
    // function create(get)
    func index(req: Request) throws -> EventLoopFuture<[Author]> {
        return Author.query(on: req.db).all()
    }
    // update function
    func update(req: Request) async throws -> HTTPStatus {
        let newAuthor = try req.content.decode(Author.self)
        guard let quote = try await Author.find(newAuthor.id, on: req.db) else {
            throw Abort(.notFound)
        }
        quote.Author_Name = newAuthor.Author_Name
        try await quote.save(on: req.db)
        return .ok
    }
//    Delete function
    func delete(req: Request) async throws -> HTTPStatus {
        
        guard let quote = try await Author.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await quote.delete(on: req.db)
        return .ok
    }
}
