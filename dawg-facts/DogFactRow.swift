//
//  DogFactRow.swift
//  dawg-facts
//
//  Created by Jason Yi on 4/22/25.
//

import SwiftUI

struct DogFactRow: View {
    let fact: DogFact

    var body: some View {
        Text(fact.attributes.body)
            .padding(.vertical, 8)
    }
}

#Preview {
    DogFactRow(fact: DogFact(
        id: "1",
        type: "fact",
        attributes: .init(body: "Dogs wag their tails when they're happy.")
    ))
}
