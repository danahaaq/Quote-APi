import Fluent
import Vapor

struct authorController: RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        let quote = routes .grouped ("author")
        quote.get (use: index)
    }
    //quote route
    func index(req: Request) throws -> EventLoopFuture<[Author]> {
        return Author.query(on: req.db).all()
    }

//    func create(req: Request) async throws -> Todo {
//        let todo = try req.content.decode(Todo.self)
//        try await todo.save(on: req.db)
//        return todo
//    }

//    func delete(req: Request) async throws -> HTTPStatus {
//        guard let todo = try await Todo.find(req.parameters.get("todoID"), on: req.db) else {
//            throw Abort(.notFound)
//        }
//        try await todo.delete(on: req.db)
//        return .noContent
//    }
}
