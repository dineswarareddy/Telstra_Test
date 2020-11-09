//
//  FactsListInteractor.swift
//  Telstra_Test
//
//  Created by Dinesh Reddy on 09/11/20.
//

import Foundation

class FactsListInteractor {
    let output: FactsListInteractorOutput
    let network: FactsNetworkDelegate?
    
    init(presenter: FactsListInteractorOutput, networkController: FactsNetworkDelegate?) {
        self.output = presenter
        self.network = networkController
    }
    
    private func updateFactsListToPresent(factsList: [Item]?) {
        if let factsListItems = factsList {
            self.output.updateFactsList(facts: factsListItems)
        }
    }
    
    private func updateError(_ errorMessage: String) {
        self.output.updateError(errorMessage: errorMessage)
    }
    
    private func updatePageTitle(title: String?) {
        self.output.updatePageTitle(title: title)
    }
}

extension FactsListInteractor: FactsListInteractorInput {
    func fetchFactsList() {
        network?.fetchFacts(completionHandler: { [weak self] (response) -> (Void) in
            switch response {
            case .success(let facts):
                self?.updateFactsListToPresent(factsList: facts.rows)
                self?.updatePageTitle(title: facts.title)
            case .failure(let error):
                self?.updateError(error.localizedDescription)
            }
        })
    }
}
