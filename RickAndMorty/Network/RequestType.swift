//
//  RequestType.swift
//  RickAndMorty
//
//  Created by Mahmoud El-Naggar on 12/01/2025.
//

import Foundation

protocol RequestType {
    associatedtype Response: Decodable
    
    var url: String { get }
    var method: RequestMethod { get }
    
    func parse(response: URLResponse, data: Data) throws -> Response
}

extension RequestType {
    func parse(response: URLResponse, data: Data) throws -> Response {
        do {
            return try JSONDecoder().decode(Response.self, from: data)
        } catch {
            throw NSError()
        }
    }
}

extension RequestType {
    var urlRequest: URLRequest {
        guard let url = URL(string: url) else { fatalError("URL is not correct")}
        var urlRequest = URLRequest(url: url)

        urlRequest.httpMethod = method.httpMethod
        return urlRequest
    }
}
