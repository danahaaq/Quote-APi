import Fluent
import Vapor

struct authorController: RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        let quote = routes .grouped ("author")
        quote.get (use: index)
    }
    //author route
    func index(req: Request) throws -> EventLoopFuture<[Author]> {
        return Author.query(on: req.db).all()
    }
}
