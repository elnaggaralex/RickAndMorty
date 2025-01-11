//
//  NetworkService.swift
//  RickAndMorty
//
//  Created by Mahmoud El-Naggar on 11/01/2025.
//

import Foundation

protocol NetworkServiceType {
    func request<Request: RequestType>(request: Request) async throws -> Request.Response
}


final class NetworkService: NetworkServiceType {
    
    private let session: URLSessionType
    
    init(session: URLSessionType = URLSession.shared) {
        self.session = session
    }
    
    func request<Request: RequestType>(request: Request) async throws -> Request.Response {
        let (data, response) = try await session.request(urlRequest: request.urlRequest)
        return try request.parse(response: response, data: data)
    }
}


enum RequestMethod {
    case get
    case post
    case put
    case delete
}

extension RequestMethod {
    var httpMethod: String {
        let method: String = switch self {
        case .get: "get"
        case .post: "post"
        case .put: "put"
        case .delete: "delete"
        }
        return method
    }
}

protocol URLSessionType {
    func request(urlRequest: URLRequest) async throws -> Response
}

typealias Response = (Data, URLResponse)
extension URLSession: URLSessionType {
    
    func request(urlRequest: URLRequest) async throws -> Response {
        try await self.data(for: urlRequest)
    }
}
