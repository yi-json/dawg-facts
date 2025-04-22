//
//  HomeView.swift
//  dawg-facts
//
//  Created by Jason Yi on 4/22/25.
//

import SwiftUI

struct HomeView: View {
    @State private var factCountString = "5"
    @State private var factCountInt: Int = 5
    @State private var showWarning = false

    var body: some View {
        NavigationStack {
            
            Image("dog")
                .resizable()
                .scaledToFit()
                .frame(height: 150)
            
            VStack(spacing: 20) {
                Text("Welcome to Dawg Facts")
                    .font(.title)

                Text("How many dog facts would you like to see? (1–10)")
                    .font(.subheadline)

                TextField("Enter number", text: $factCountString)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
                    .frame(maxWidth: 200)
                    .onChange(of: factCountString, initial: true) {
                        if let intVal = Int(factCountString) {
                            if intVal < 1 || intVal > 10 {
                                showWarning = true
                            } else {
                                factCountInt = intVal
                                showWarning = false
                            }
                        } else {
                            showWarning = true
                        }
                    }

                if showWarning {
                    Text("Please enter a number between 1 and 10.")
                        .foregroundColor(.red)
                        .font(.caption)
                }

                NavigationLink {
                    DogFactListView(factCount: $factCountInt)
                } label: {
                    Text("Fetch Facts")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(showWarning ? Color.gray : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .disabled(showWarning)
                .padding(.horizontal)
            }
            .padding()
        }
    }
}

#Preview {
    HomeView()
}
