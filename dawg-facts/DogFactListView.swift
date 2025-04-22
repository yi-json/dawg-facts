//
//  DogFactListView.swift
//  dawg-facts
//
//  Created by Jason Yi on 4/22/25.
//

import SwiftUI

struct DogFactListView: View {
    @ObservedObject var service = DogFactService()
    @Binding var factCount: Int

    var body: some View {
        VStack {
            if let error = service.errorMessage {
                Text("Error: \(error)").foregroundColor(.red)
            }

            Text("Showing \(service.dogFacts.count) dog facts")
                .font(.headline)
                .padding()

            List(service.dogFacts) { fact in
                DogFactRow(fact: fact)
            }
        }
        .onAppear {
            service.fetchFacts(limit: factCount)
        }
    }
}
