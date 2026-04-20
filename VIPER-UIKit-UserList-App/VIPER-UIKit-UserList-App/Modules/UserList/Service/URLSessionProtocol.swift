//
//  URLSessionProtocol.swift
//  VIPER-UIKit-UserList-App
//
//  Created by Medikonda Anil kumar on 20/04/26.
//

import Foundation
import Foundation

protocol URLSessionProtocol {
    func dataTask(with url: URL,completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol {}
