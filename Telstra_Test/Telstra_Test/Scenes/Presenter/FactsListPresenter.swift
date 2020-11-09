//
//  FactsListPresenter.swift
//  Telstra_Test
//
//  Created by Dinesh Reddy on 09/11/20.
//

import Foundation

class FactsListPresenter {
    var view: FactsListPresenterOutput?
    
    init(view: FactsListPresenterOutput?) {
        self.view = view
    }
}

extension FactsListPresenter: FactsListInteractorOutput {
    func updateFactsList(facts: [Item]) {
        view?.displayFactsList(items: facts)
    }
    
    func updatePageTitle(title: String?) {
        view?.displayPageTitle(pageTitle: title ?? "")
    }
    
    func updateError(errorMessage: String) {
        view?.displayErrorMessage(message: errorMessage)
    }
}
