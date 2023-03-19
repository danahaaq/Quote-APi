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
        let quote = routes .grouped("Quotee")
        quote.get (use: index)
    }
    //quote route
    func index(req: Request) throws -> EventLoopFuture<[Quote]> {
        return Quote.query(on: req.db).all()
    }
}
