//
//  FactsListViewFactory.swift
//  Telstra_Test
//
//  Created by Dinesh Reddy on 09/11/20.
//

import Foundation
import UIKit

enum FactsListViewFactory {
    static func createFactsViewFactory(view: FactsListPresenterOutput?) -> FactsListInteractorInput {
        let networkController = FactsNetworkController()
        let presenter = FactsListPresenter(view: view)
        let interactor = FactsListInteractor(presenter: presenter, networkController: networkController)
        return interactor
    }
}
