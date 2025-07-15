//
//  Network.swift
//  CriCut
//
//  Created by Seeyon on 15/7/25.
//

import Foundation

/// Abstract protocol for network requests
protocol Network {
    func fetch(from url: URL) async throws -> Data
}

///Concrete network implementation using URLSession
class NetworkManager: Network  {
    func fetch(from url: URL) async throws -> Data {
        let (data, response) = try await URLSession.shared.data(from: url)
        if let response = response as? HTTPURLResponse, response.statusCode == 200 {
            return data
        }
        throw CricutError.invalidResponse
    }
}
    

