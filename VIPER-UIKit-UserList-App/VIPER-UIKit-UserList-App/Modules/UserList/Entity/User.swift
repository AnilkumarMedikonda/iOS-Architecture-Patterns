//
//  User.swift
//  VIPER-UIKit-UserList-App
//
//  Created by Medikonda Anil kumar on 20/04/26.
//

import Foundation

struct User: Decodable {
    let id: Int
    let name: String
    let email: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case email
    }
    
    init(id: Int, name: String, email: String) {
            self.id = id
            self.name = name
            self.email = email
        }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? "N/A"
        email = try container.decodeIfPresent(String.self, forKey: .email) ?? "N/A"
    }
}
