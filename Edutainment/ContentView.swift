//
//  ContentView.swift
//  Edutainment
//
//  Created by Ellie on 9/10/24.
//

import SwiftUI

struct Question: Hashable {
    let a: Int
    let b: Int
    
    var text: String {
        "\(a) × \(b)"
    }
    
    var answer: Int {
        a * b
    }
}
struct ContentView: View {
    
    @State private var questionsNumber = [5, 10, 20]
    @State private var questionsInput = 5
    @State private var questionNumber = 0
    @State private var modeInput = "easy"
    @State private var howDifficult = ["easy", "medium", "hard"]
    
    @State private var tableStart = 2 // Starting multiplication table
    @State private var tableEnd = 5 // Ending multiplication table
    
//    @State private var answerInput = ""
//    @State private var randomizedQuestions = [Question]() // Holds filtered and randomized questions
//    @State private var currentQuestionIndex = 0
//    
//    @State private var scoreTitle = ""
//    @State private var userScores = 0
//    @State private var showingScore = false
//    @State private var showingFinalScore = false
//    @State private var answerOutput = 1
//    var correctAnswer: Int { randomizedQuestions[currentQuestionIndex].answer }
    
//    enum Difficulty: String, CaseIterable {
//        case easy = "easy"
//        case medium = "medium"
//        case hard = "hard"
//    }
//    
//    enum QuestionCount: Int, CaseIterable {
//        case five = 5
//        case ten = 10
//        case twenty = 20
//    }
//    func setupQuestions(questionNumber: Int, difficulty: Difficulty, tableRange: ClosedRange<Int>) -> [Question] {
//        
//        var questions = Set<Question>()
//        
//        let multiplierRange: ClosedRange<Int>
//        
//        
//        switch difficulty {
//        case .easy:
//            multiplierRange = 1...5
//        case .medium:
//            multiplierRange = 6...9
//        case .hard:
//            multiplierRange = 10...12
//        }
//        while questions.count < questionNumber {
//            let a = Int.random(in: tableRange)
//            let b = Int.random(in: multiplierRange)
//            
//            let newQuestion = Question(a: a, b: b)
//            questions.insert(newQuestion)
//        }
//        return Array(questions)
//    }
//    
//    func resetGame() {
//        questionNumber = 0
//        currentQuestionIndex = 0
//        userScores = 0
//        answerInput = ""
//        randomizedQuestions = []
//    }
//    
//    func userAnswer(_ number: Int) {
//        if number == correctAnswer {
//            scoreTitle = "Correct"
//            userScores += 1
//        } else {
//            scoreTitle = "Incorrect! The correct answer is \(correctAnswer)"
//        }
//        
//        if questionNumber < questionsInput - 1 {
//            questionNumber += 1
//            showingScore = true
//        } else {
//            showingFinalScore = true
//        }
//    }
//    
//    func nextQuestion() {
//        if currentQuestionIndex < randomizedQuestions.count - 1 {
//            currentQuestionIndex += 1
//        }
//        answerInput = ""
//    }
//    func regenerateQuestions() {
//        if let selectedDifficulty = Difficulty(rawValue: modeInput) {
//            randomizedQuestions = setupQuestions(
//                questionNumber: questionsInput,
//                difficulty: selectedDifficulty,
//                tableRange: tableStart...tableEnd
//            )
//            currentQuestionIndex = 0 // Reset question index to the first question
//            answerInput = "" // Clear the previous answer
//        }
//    }
    var body: some View {
        NavigationStack {
            Form {
                // Section for selecting the number of questions
                Section("How many questions do you want to practice?") {
                    Picker("Please enter amount", selection: $questionsInput) {
                        ForEach(questionsNumber, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .labelsHidden()
                }
                
                // Section for selecting difficulty
                Section("Pick your difficulty") {
                    Picker("Difficulty", selection: $modeInput) {
                        ForEach(howDifficult, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .labelsHidden()
                }
                
                // Section for selecting the multiplication table range
                Section("Select multiplication table range") {
                    Stepper("Start at \(tableStart)", value: $tableStart, in: 2...12, step: 1) {_ in
                        if tableStart > tableEnd {
                            tableEnd = tableStart
                        }
                    }
                    Stepper("End at \(tableEnd)", value: $tableEnd, in: tableStart...12, step: 1) {_ in
                        if tableEnd < tableStart {
                            tableStart = tableEnd
                            
                        }
                    }
                }
                    Section("Ready to practice?") {
                        NavigationLink(destination: PracticeView(questionsInput: questionsInput, modeInput: modeInput, tableStart: tableStart, tableEnd: tableEnd)) {
                            Text("Start Practice")
                        
                    }
                }
                .navigationTitle("Multiplication Practice")
            }
        }
    }
}
                


#Preview {
    ContentView()
}
