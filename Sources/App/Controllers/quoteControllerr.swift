//
//  quoteControllerr.swift
//  
//
//  Created by Aldanah Alqbbani on 24/08/1444 AH.
//

import Fluent
import Vapor

struct quoteControllerr: RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        //quote route
        let quote = routes .grouped("Quotee")
        quote.get (use: get)
        
        quote.delete(":id", use: delete)
        quote.put(use: update)
    }
    
    func get(req: Request) throws -> EventLoopFuture<[Quotee]> {
        return Quotee.query(on: req.db).all()
    }
    // function update
    func update(req: Request) async throws -> HTTPStatus {
        let newQuote = try req.content.decode(Quotee.self)
        
        guard let quote = try await Quotee.find(newQuote.id, on: req.db) else {
            throw Abort(.notFound)
        }
        quote.Quotes = newQuote.Quotes
        quote.Source = newQuote.Source
        quote.author_id = newQuote.author_id
        try await quote.save(on: req.db)
        return .ok
    }
    
    // fuction delete
    func delete(req: Request) async throws -> HTTPStatus {
        guard let quote = try await Quotee.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await quote.delete(on: req.db)
        return .ok
    }
}
