//
//  Webservice.swift
//  MoviesJonas
//
//  Created by Jonas Romankiewicz on 21.11.22.
//

import Foundation

enum MoviesError: Error {
    case invalidServiceResponse
}

class WebService {
    func getMovies(url: URL) async throws -> [Movie] {
        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw MoviesError.invalidServiceResponse
        }

        return try JSONDecoder().decode([Movie].self, from: data)
    }
}
