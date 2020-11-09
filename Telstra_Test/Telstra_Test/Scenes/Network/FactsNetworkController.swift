//
//  FactsNetworkController.swift
//  Telstra_Test
//
//  Created by Dinesh Reddy on 09/11/20.
//

import Foundation

protocol FactsNetworkDelegate {
    func fetchFacts(completionHandler: @escaping(Result<Facts, Error>) -> (Void))
}

class FactsNetworkController {
    private func initiateFactsListAPICall(requestURL: URL, completionHandler: @escaping(Result<Facts, Error>) -> (Void)) {
        APIHandler.initiateAPICall(requestURL: requestURL) { (response) -> (Void) in
            switch response {
            case .success(let responseData):
                if let utf8Data = String(data: responseData, encoding: String.Encoding.isoLatin1)?.data(using: .utf8) {
                    do {
                        if let facts: Facts = try NetworkUtilitySupporter.prepareModelFromData(utf8Data) {
                            completionHandler(.success(facts))
                        }
                    }
                    catch let jsonError {
                        completionHandler(.failure(jsonError)) }
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}

extension FactsNetworkController: FactsNetworkDelegate {
    func fetchFacts(completionHandler: @escaping (Result<Facts, Error>) -> (Void)) {
        if let factsListURLString = PListAccessor.factsListAPIURL, let requestURL = URL(string: factsListURLString) {
            self.initiateFactsListAPICall(requestURL: requestURL) { (response) -> (Void) in
                completionHandler(response)
            }
        }
    }
}
