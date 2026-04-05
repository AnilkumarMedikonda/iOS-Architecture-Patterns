//
//  NetworkManaging.swift
//  MVC-UIKit-UserList-App
//
//  Created by Medikonda Anil kumar on 05/04/26.
//

import Foundation


protocol NetworkManaging {
    func request<T: Decodable>(url: URL,completion: @escaping (Result<T, NetworkError>) -> Void)
}
