import Fluent

struct CreateAuthor:Migration{
    
    // these are the changes we want to make
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        // we have table called songs
        // this songs have two culomns id and title
        database.schema("Author")
            .id()
            .field("Author_Name", .string, .required)
            .create()
    }
    // these if we want to revert those changes
    func revert(on database: Database) -> EventLoopFuture<Void> {
         database.schema("Author").delete()
    }
        
}
