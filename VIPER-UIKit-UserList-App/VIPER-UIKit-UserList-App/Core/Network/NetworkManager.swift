//
//  NetworkManager.swift
//  VIPER-UIKit-UserList-App
//
//  Created by Medikonda Anil kumar on 20/04/26.
//

import Foundation

final class NetworkManager: NetworkManaging {

    private let session: URLSessionProtocol

    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }

    func request<T: Decodable>(url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {

        session.dataTask(with: url) { data, response, error in

            if let error = error {
                self.complete(.failure(.unknown(error)), completion)
                return
            }

            guard let http = response as? HTTPURLResponse else {
                self.complete(.failure(.invalidResponse), completion)
                return
            }

            guard (200...299).contains(http.statusCode) else {
                self.complete(.failure(.serverError(http.statusCode)), completion)
                return
            }

            guard let data = data else {
                self.complete(.failure(.noData), completion)
                return
            }

            let result: Result<T, NetworkError> = self.decode(data: data)
            self.complete(result, completion)

        }.resume()
    }

    private func complete<T>(_ result: Result<T, NetworkError>, _ completion: @escaping (Result<T, NetworkError>) -> Void) {
        DispatchQueue.main.async { completion(result) }
    }

    private func decode<T: Decodable>(data: Data) -> Result<T, NetworkError> {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return .success(try decoder.decode(T.self, from: data))
        } catch {
            return .failure(.decodingError)
        }
    }
}
