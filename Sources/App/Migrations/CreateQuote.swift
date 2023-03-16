import Fluent

struct CreateQuote:Migration{
    
    // these are the changes we want to make
    func prepare(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        // we have table called songs
        // this songs have two culomns id and title
        return database.schema("Author")
            .id()
            .field("Author_Name", .string, .required)
            .create()
    }
    // these if we want to revert those changes
    func revert(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        return database.schema("Author").delete()
    }
        
}
