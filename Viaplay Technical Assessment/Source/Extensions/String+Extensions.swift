//
//  String+Extensions.swift
//  Viaplay Technical Assessment
//
//  Created by Carlos Gonzalez2 on 13/4/24.
//

import Foundation

extension String {
    func transformToURL(cleanupParameters: Bool = true) -> URL? {
        if cleanupParameters {
            let rawUri = self.replacingOccurrences(of: "{", with: "")
            if let url = URL(string: rawUri), var components = URLComponents(url: url, resolvingAgainstBaseURL: true) {
                components.query = nil
                if var cleanedURL = components.url?.absoluteString {
                    cleanedURL = cleanedURL.replacingOccurrences(of: "{", with: "")
                    return URL(string: cleanedURL)
                }
            }
        }
        
        return URL(string: self)
    }
}
