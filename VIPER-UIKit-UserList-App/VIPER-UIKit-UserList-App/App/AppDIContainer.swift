//
//  AppDIContainer.swift
//  VIPER-UIKit-UserList-App
//
//  Created by Medikonda Anil kumar on 20/04/26.
//

import Foundation


final class AppDIContainer {
    
    lazy var network: NetworkManaging = NetworkManager()
    
    func makeUserService() -> UserServiceProtocol {
        UserService(network: network)
    }
}
