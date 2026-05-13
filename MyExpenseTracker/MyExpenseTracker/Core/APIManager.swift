//
//  APIManager.swift
//  MyExpenseTracker
//
//  Created by Nikita on 09/05/26.
//

import UIKit
import Foundation

struct Posts: Codable, Identifiable {
    let id: Int
    let title: String
    let userId: Int
    var body: String
}

enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
    case serverError(Int)
}

class APIManager: NSObject {
    
//    static let shared = APIManager()
    
    func fetchPosts() async throws -> [Posts] {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let users = try JSONDecoder().decode([Posts].self, from: data)
        return users
    }
    
    func request<T: Decodable>(urlString: String, method: HTTPMethod, body: Data? = nil, headers: [String: String]) async throws -> T {
        
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        
        headers.forEach {
            request.setValue($0.value, forHTTPHeaderField: $0.key)
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        
        //check status code
        guard 200...299 ~= httpResponse.statusCode else {
            throw APIError.serverError(httpResponse.statusCode)
        }
        
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            throw APIError.decodingError
        }
    }
}

