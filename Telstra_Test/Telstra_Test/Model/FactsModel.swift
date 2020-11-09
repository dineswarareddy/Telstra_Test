//
//  FactsModel.swift
//  Telstra_Test
//
//  Created by Dinesh Reddy on 09/11/20.
//

import Foundation

struct Facts: Decodable {
    let title: String?
    let rows: [Item]?
    
    internal init(title: String?, rows: [Item]) {
        self.title = title
        self.rows = rows
    }
}

struct Item: Decodable {
    let title: String?
    let description: String?
    let imageHref: String?
    
    internal init(title: String?, description: String?, imageHref: String?) {
        self.title = title
        self.description = description
        self.imageHref = imageHref
    }
}
