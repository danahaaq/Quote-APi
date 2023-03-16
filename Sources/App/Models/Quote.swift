import Fluent
import Vapor

// mappping, connection with database
// It represent our data in the database
final class Quote: Model, Content {
    static let schema = "Quote"
    
    @ID(key: .id)
    // optional beacuse its autogenrated on the database
    var id: UUID?

    @Field(key: "Quotes")
    var Quotes: String

    @Field(key: "Source")
    var Source: String
    
    init() { }

    init(id: UUID? = nil, Quotes: String,Source: String ) {
        self.id = id
        self.Quotes = Quotes
        self.Source = Source
    }
}
