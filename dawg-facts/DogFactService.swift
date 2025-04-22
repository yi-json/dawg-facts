//
//  DogFactService.swift
//  dawg-facts
//
//  Created by Jason Yi on 4/22/25.
//

import Foundation

class DogFactService: ObservableObject {
    @Published var dogFacts: [DogFact] = []
    @Published var errorMessage: String?

    func fetchFacts(limit: Int = 5) {
        dogFacts = []
        errorMessage = nil

        let clampedLimit = min(limit, 10)
        let chunkSize = 5
        let numberOfRequests = Int(ceil(Double(clampedLimit) / Double(chunkSize)))

        let dispatchGroup = DispatchGroup()
        var allFacts: [DogFact] = []
        var encounteredError: String?

        for _ in 0..<numberOfRequests {
            dispatchGroup.enter()
            guard let url = URL(string: "https://dogapi.dog/api/v2/facts?limit=\(chunkSize)") else {
                encounteredError = "Invalid URL."
                dispatchGroup.leave()
                continue
            }

            URLSession.shared.dataTask(with: url) { data, _, error in
                defer { dispatchGroup.leave() }

                if let error = error {
                    encounteredError = "Error: \(error.localizedDescription)"
                    return
                }

                guard let data = data else {
                    encounteredError = "No data received."
                    return
                }

                do {
                    let decoded = try JSONDecoder().decode(DogFactResponse.self, from: data)
                    allFacts += decoded.data
                } catch {
                    encounteredError = "Decoding error: \(error.localizedDescription)"
                }
            }.resume()
        }

        dispatchGroup.notify(queue: .main) {
            if let error = encounteredError {
                self.errorMessage = error
            } else {
                self.dogFacts = Array(allFacts.prefix(clampedLimit)) // Trim any extras
            }
        }
    }
}
