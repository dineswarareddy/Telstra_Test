//
//  FactsListPresenterBoundaries.swift
//  Telstra_Test
//
//  Created by Dinesh Reddy on 09/11/20.
//

import Foundation

protocol FactsListPresenterOutput{
    func displayFactsList(items: [Item])
    func displayPageTitle(pageTitle: String)
    func displayErrorMessage(message: String)
}
