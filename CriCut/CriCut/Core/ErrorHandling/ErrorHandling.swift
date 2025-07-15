//
//  ErrorHandling.swift
//  CriCut
//
//  Created by Seeyon on 15/7/25.
//

enum CricutError: Error {
    case invalidResponse
    case invalidRequest
    case inValidURL
    case networkError(Error)
}
