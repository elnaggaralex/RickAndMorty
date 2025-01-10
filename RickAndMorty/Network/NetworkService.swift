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
        return request.parse(response: response, data: data)
    }
    
}

protocol RequestType {
    associatedtype Response
    
    var url: String { get }
    var method: RequestMethod { get }
    
    func parse(response: URLResponse, data: Data) -> Response
}

extension RequestType {
    var urlRequest: URLRequest {
        guard let url = URL(string: url) else { fatalError("URL is not correct")}
        let urlRequest = URLRequest(url: url)
        
        return urlRequest
    }
}


enum RequestMethod {
    case get
    case post
    case put
    case delete
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
