//
//  MockNetworkManager.swift
//  MVC-UIKit-UserList-App
//
//  Created by Medikonda Anil kumar on 05/04/26.
//

import Foundation

@testable import MVC_UIKit_UserList_App

class MockNetworkManager: NetworkManaging {
    
    var shouldReturnError = false
    var mockUsers: [User] = []
    
    func request<T: Decodable>(url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        if shouldReturnError {
            completion(.failure(.noData))
        } else {
            completion(.success(mockUsers as! T))
        }
    }
}
