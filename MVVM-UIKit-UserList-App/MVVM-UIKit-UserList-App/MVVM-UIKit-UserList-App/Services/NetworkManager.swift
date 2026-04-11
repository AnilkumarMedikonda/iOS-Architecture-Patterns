//
//  NetworkManager.swift
//  MVVM-UIKit-UserList-App
//
//  Created by Medikonda Anil kumar on 11/04/26.
//

import Foundation

class NetworkManager: NetworkManaging {
    
    func request<T: Decodable>(url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(.unknown(error)))
                }
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse,
               !(200...299).contains(httpResponse.statusCode) {
                
                DispatchQueue.main.async {
                    completion(.failure(.serverError(statusCode: httpResponse.statusCode)))
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(.noData))
                }
                return
            }
            
            let result: Result<T, NetworkError> = self.decode(data: data)
            
            DispatchQueue.main.async {
                completion(result)
            }
            
        }.resume()
    }
    
    private func decode<T: Decodable>(data: Data) -> Result<T, NetworkError> {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let decoded = try decoder.decode(T.self, from: data)
            return .success(decoded)
            
        } catch {
            return .failure(.decodingError)
        }
    }
}
