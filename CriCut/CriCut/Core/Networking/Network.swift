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
    /// Fetches raw `Data` from a given URL using URLSession.
   /// - Parameter url: The endpoint to fetch data from.
   /// - Returns: Raw `Data` if response is successful (HTTP 200).
   /// - Throws: `CricutError.invalidResponse` if status code isn't 200 or request fails.
    func fetch(from url: URL) async throws -> Data {
        let (data, response) = try await URLSession.shared.data(from: url)
        if let response = response as? HTTPURLResponse, response.statusCode == 200 {
            return data
        }
        throw CricutError.invalidResponse
    }
}
    

