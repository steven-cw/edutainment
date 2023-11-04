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
    @State private var tries = 0
    @State private var table = [Int]()
    @State private var showingScore = false
    @State private var gameOn = false
    
    let questions = [5, 10, 20]
    
    var body: some View {
        ZStack {
            VStack {
                Image("bear")
                    .resizable()
                    .frame(width: 400.0, height: 400.0)
            }
            Form {
                if gameOn == false {
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
                }
                Button {
                    gameActive = true
                    startGame()
                    newQuestion()
                    gameOn.toggle()
                }
            label: {
                Text(gameOn == true ? "New Game": "Start Game")
            }
                if gameOn {
                    Section {
                        VStack {
                            Text("What is \(num1) x \(num2)")
                                .font(.largeTitle.bold())
                        }
                    }
                    
                    Section {
                        TextField("Amount", value: $input, format:
                                .number)
                        .keyboardType(.decimalPad)
                    } header: {
                        Text("Your Answer:")
                    }
                    
                    Button {
                        checkAnswer()
                        newQuestion()
                    }
                label: {
                    Text("Submit Answer")
                }
                }
            }
            .opacity(0.8)
            VStack {
                Image("bear")
                    .resizable()
                    .frame(width: 300.0, height: 300.0)
            }
            
        }
        .alert("Game over!", isPresented: $showingScore) {
            Button("Continue", action: startGame)
                    } message: {
                        Text("Your score is \(correct)/\(tries)")
        }
        .padding()
    }
    
    func startGame() {
        tries = 0
        correct = 0
        table = [Int](0...timesTable)
    }
    
    func newQuestion() {
        num1 = table.randomElement() ?? 0
        num2 = table.randomElement() ?? 0
        correctAnswer = num1 * num2
    }
    
    func checkAnswer() {
        input = 0
        tries += 1
        if input == correctAnswer {
            correct += 1
        }
        if tries == questionsSelection {
            showingScore = true
        }
    }
}

#Preview {
    ContentView()
}
