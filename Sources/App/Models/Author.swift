import Fluent
import Vapor

// mappping, connection with database
// It represent our data in the database
final class Author: Model, Content {
    static let schema = "Author"
    
    @ID(key: .id)
    // optional beacuse its autogenrated on the database
    var id: UUID?

    @Field(key: "Author_Name")
    var Author_Name: String
    
    @Children(for: \.$author_id)
    var qouts: [Quotee]

    init() { }

    init(id: UUID? = nil, title: String) {
        self.id = id
        self.Author_Name = Author_Name
    }
}
