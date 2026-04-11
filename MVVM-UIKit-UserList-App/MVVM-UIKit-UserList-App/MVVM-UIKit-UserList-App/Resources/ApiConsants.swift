//
//  ApiConsants.swift
//  MVVM-UIKit-UserList-App
//
//  Created by Medikonda Anil kumar on 11/04/26.
//

import Foundation

struct APIConstants {
    
    static let baseURL = "https://jsonplaceholder.typicode.com"
    
    enum EndPoints: String {
        case users = "/users"
        
        var url: URL? {
            return URL(string: APIConstants.baseURL + self.rawValue)
        }
    }
}
