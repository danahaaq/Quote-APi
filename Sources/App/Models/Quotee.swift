//
//  Quotee.swift
//  
//
//  Created by Aldanah Alqbbani on 28/08/1444 AH.
//

import Fluent
import Vapor

// mappping, connection with database
// It represent our data in the database
final class Quotee: Model, Content {
    static let schema = "Quuote"
    
    @ID(key: .id)
    // optional beacuse its autogenrated on the database
    var id: UUID?

    @Field(key: "Quotes")
    var Quotes: String

    @Field(key: "Source")
    var Source: String
    
    @Field(key: "author_id")
    var author_id: UUID?
    
    
    init() { }

    init(id: UUID? = nil, Quotes: String,Source: String, author_id: UUID? = nil) {
        self.id = id
        self.Quotes = Quotes
        self.Source = Source
        self.author_id = author_id
    }
}
