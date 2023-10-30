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
    @State private var questionsSelection = 5
    @State private var num1 = 0
    @State private var num2 = 0
    @State private var correctAnswer = 0
    @State private var input = 0
    @State private var correct = 0
    @State private var table = [Int]()
    
    var questions = [5, 10, 20]
    
    var body: some View {
        Form {
            Section {
                Stepper("Times tables up to \(timesTable)", value: $timesTable, in: 2...12, step: 1)
            }
            Section {
                    Picker("Questions", selection: $questionsSelection) {
                        ForEach(questions, id: \.self) {
                            Text(String($0))
                        }
                    }
            }
            Button {
                gameActive = true
                startGame()
            }
                    label: {
                        Text("Ready to Play!")
                    }
            
            Section {
                Text("What is \(num1) x \(num2)")
            }
            
            Section {
                TextField("Amount", value: $input, format:
                        .number)
                .keyboardType(.decimalPad)
            } header: {
                Text("Enter number:")
            }
            
            Button {
                checkAnswer()
                newQuestion()
            }
                    label: {
                        Text("Submit Answer")
                    }
            Section {
                Text("Correct: \(correct)")
            }
        }
        .padding()
    }
    
    func startGame() {
        table = [Int](0...questionsSelection)
        newQuestion()
    }
    
    func newQuestion() {
        num1 = table.randomElement() ?? 0
        num2 = table.randomElement() ?? 0
        correctAnswer = num1 * num2
    }
    
    func checkAnswer() {
        if input == correctAnswer {
            correct += 1
        }
    }
}

#Preview {
    ContentView()
}
