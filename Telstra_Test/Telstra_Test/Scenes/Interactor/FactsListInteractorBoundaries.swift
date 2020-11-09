//
//  FactsListInteractorBoundaries.swift
//  Telstra_Test
//
//  Created by Dinesh Reddy on 09/11/20.
//

import Foundation

protocol FactsListInteractorInput {
    func fetchFactsList()
}

protocol FactsListInteractorOutput {
    func updateFactsList(facts: [Item])
    func updatePageTitle(title: String?)
    func updateError(errorMessage: String)
}
