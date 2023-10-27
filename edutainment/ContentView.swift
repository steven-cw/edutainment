//
//  ContentView.swift
//  edutainment
//
//  Created by Steven Williams on 10/26/23.
//

import SwiftUI

struct ContentView: View {
    @State private var gameActive = false
    @State private var timesTable = 2
    @State private var questions = [5, 10, 20]
    let table = [Int]()
    
    var body: some View {
        Form {
            Section {
                Stepper("Times tables up to \(timesTable)", value: $timesTable, in: 2...12, step: 1)
            }
            Section {
                    Picker("Questions", selection: $questions) {
                        ForEach(questions, id: \.self) {
                            Text(String($0))
                        }
                    }
            }
            Button {
                gameActive = true
            }
                    label: {
                        Text("Ready to Play!")
                    }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
