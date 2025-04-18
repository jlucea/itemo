//
//  HTTPClient.swift
//  Itemo
//
//  Created by Jaime Lucea on 18/4/25.
//

import Foundation

enum HTTPError: Error {
    case invalidResponse
    case decodingFailed
}

final class HTTPClient {
    static let shared = HTTPClient()

    private init() {}

    public func doRequest<T: Decodable>(request: URLRequest) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            throw HTTPError.invalidResponse
        }

        do {
            let decoded = try JSONDecoder().decode(T.self, from: data)
            return decoded
        } catch {
            throw HTTPError.decodingFailed
        }
    }
}
