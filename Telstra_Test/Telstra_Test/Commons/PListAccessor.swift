//
//  PListAccessor.swift
//  Telstra_Test
//
//  Created by Dinesh Reddy on 09/11/20.
//

import Foundation

class PListAccessor {
    
    static private var infoDictionary: NSDictionary? {
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist") {
            let nsDictionary = NSDictionary(contentsOfFile: path)
            return nsDictionary
        } else {
            return nil
        }
    }
    
    static var factsListAPIURL: String? {
        if let infoDictionary = infoDictionary {
            let apiURL = infoDictionary["factsListURL"] as? String
            return apiURL
        } else {
            return nil
        }
    }
}
