//
//  DogFact.swift
//  dawg-facts
//
//  Created by Jason Yi on 4/22/25.
//

import Foundation

struct DogFactResponse: Codable {
    let data: [DogFact]
}

struct DogFact: Codable, Identifiable {
    let id: String
    let type: String
    let attributes: Attributes

    struct Attributes: Codable {
        let body: String
    }
}
