//
//  Network.swift
//  Viaplay Technical Assessment
//
//  Created by Carlos Gonzalez2 on 13/4/24.
//

import Foundation

final class Network {
    static let shared = Network()
    
    func callTo<JSON>(url: URL, method: String) async throws -> JSON where JSON: Decodable {
        do {
            let (data, _) = try await getData(from: url, httpMethod: method)
            do {
                return try JSONDecoder().decode(JSON.self, from: data)
            } catch {
                throw fatalError()
            }
        } catch {
            throw fatalError()
        }
    }

    func callTo<JSON>(endpoint: Endpoint,
                      urlParams: String? = nil) async throws -> JSON where JSON: Decodable {
        
        var urlStr = API_HOST + endpoint.path

        if let urlParams {
            urlStr += "/\(urlParams)"
        }

        guard let url = URL(string: urlStr)
        else {
//            throw MyMangasError.netInvalidParameter
            throw fatalError()
        }
        
        return try await callTo(url: url, method: endpoint.method)
    }

    private func getData(from url: URL,
                         httpMethod: String = "GET",
                         httpBody: Data? = nil) async throws -> (Data, HTTPURLResponse) {
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.httpBody = httpBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let (data, response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse
        else {
//            throw MyMangasError.netNoHTTP
            throw fatalError()
        }

        guard response.statusCode == 200
        else {
//            let error = try? JSONDecoder().decode(UserEndpointResponse.self, from: data)
//            throw MyMangasError.netBadStatus(response.statusCode, error?.reason)
            throw fatalError()
        }

        return (data, response)
    }
}
