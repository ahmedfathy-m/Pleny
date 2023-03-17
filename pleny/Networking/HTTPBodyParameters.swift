//
//  HTTPBodyParameters.swift
//  pleny
//
//  Created by Ahmed Fathy on 17/03/2023.
//

import Foundation

typealias HTTPBodyParameters = [String: Any]

extension HTTPBodyParameters {
    func encodeParamters(as method: HTTPBodyEncoding) -> Data? {
        guard !self.isEmpty else { return nil }
        switch method {
        case .formURLEncoded:
            return self.map {
                "\($0.key)=\($0.value)"
            }.joined(separator: "&")
                .data(using: .utf8)
        case .json:
            return try? JSONSerialization.data(withJSONObject: self)
        }
    }
}
