//
//  MockNetworkManager.swift
//  MVVM-UIKit-UserList-AppTests
//
//  Created by Medikonda Anil kumar on 11/04/26.
//

import Foundation
@testable import MVVM_UIKit_UserList_App

class MockNetworkManager: NetworkManaging {
    
    var shouldReturnError = false
    var mockUsers: [User] = []
    
    func request<T: Decodable>(url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
        if shouldReturnError {
            completion(.failure(.noData))
        } else {
            if let result = mockUsers as? T {
                completion(.success(result))
            } else {
                completion(.failure(.decodingError))
            }
        }
    }
}
