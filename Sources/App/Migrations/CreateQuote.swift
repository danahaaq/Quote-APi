//
//  CreateQuote.swift
//  
//
//  Created by Aldanah Alqbbani on 24/08/1444 AH.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateQuote:Migration{
    
    // these are the changes we want to make
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        // we have table called songs
        // this songs have two culomns id and title
        database.schema("Quote")
            .id()
            .field("Quotes", .string, .required)
            .field("Source", .string, .required)
            .create()
    }
    // these if we want to revert those changes
    func revert(on database: Database) -> EventLoopFuture<Void> {
         database.schema("Quote").delete()
    }
        
}
