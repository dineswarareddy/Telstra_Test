//
//  NetworkUtilitySupporter.swift
//  Telstra_Test
//
//  Created by Dinesh Reddy on 09/11/20.
//

import Foundation

class NetworkUtilitySupporter {
    class func prepareModelFromData<T: Decodable>(_ responseData: Data) throws -> T {
        return try JSONDecoder().decode(T.self, from: responseData)
    }
}
