//
//  PracticeView.swift
//  Edutainment
//
//  Created by Ellie on 9/23/24.
//

import SwiftUI

struct PracticeView: View {
    let questionsInput: Int
       let modeInput: String
       let tableStart: Int
       let tableEnd: Int
       
    @State private var questionsNumber = [5, 10, 20]
    @State private var questionNumber = 0
    @State private var howDifficult = ["easy", "medium", "hard"]

    @State private var answerInput = ""
    @State private var randomizedQuestions = [Question]() // Holds filtered and randomized questions
    @State private var currentQuestionIndex = 0
    
    @State private var scoreTitle = ""
    @State private var userScores = 0
    @State private var showingScore = false
    @State private var showingFinalScore = false
    @State private var answerOutput = 1
    var correctAnswer: Int { randomizedQuestions[currentQuestionIndex].answer }
    
    enum Difficulty: String, CaseIterable {
        case easy = "easy"
        case medium = "medium"
        case hard = "hard"
    }
    
    enum QuestionCount: Int, CaseIterable {
        case five = 5
        case ten = 10
        case twenty = 20
    }
    func setupQuestions(questionNumber: Int, difficulty: Difficulty, tableRange: ClosedRange<Int>) -> [Question] {
        
        var questions = Set<Question>()
        
        let multiplierRange: ClosedRange<Int>
        
        
        switch difficulty {
        case .easy:
            multiplierRange = 1...5
        case .medium:
            multiplierRange = 6...9
        case .hard:
            multiplierRange = 10...12
        }
        while questions.count < questionNumber {
            let a = Int.random(in: tableRange)
            let b = Int.random(in: multiplierRange)
            
            let newQuestion = Question(a: a, b: b)
            questions.insert(newQuestion)
        }
        return Array(questions)
    }
    
    func resetGame() {
        questionNumber = 0
        currentQuestionIndex = 0
        userScores = 0
        answerInput = ""
        randomizedQuestions = []
    }
    
    func userAnswer(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            userScores += 1
        } else {
            scoreTitle = "Incorrect! The correct answer is \(correctAnswer)"
        }
        
        if questionNumber < questionsInput - 1 {
            questionNumber += 1
            showingScore = true
        } else {
            showingFinalScore = true
        }
    }
    
    func nextQuestion() {
        if currentQuestionIndex < randomizedQuestions.count - 1 {
            currentQuestionIndex += 1
        }
        answerInput = ""
    }
    func regenerateQuestions() {
        if let selectedDifficulty = Difficulty(rawValue: modeInput) {
            randomizedQuestions = setupQuestions(
                questionNumber: questionsInput,
                difficulty: selectedDifficulty,
                tableRange: tableStart...tableEnd
            )
            currentQuestionIndex = 0 // Reset question index to the first question
            answerInput = "" // Clear the previous answer
        }
    }
    var body: some View {
        Button("Ready?") {
            regenerateQuestions()
        }
        if !randomizedQuestions.isEmpty {
            Section("Question \(questionNumber + 1) of \(questionsInput)") {
                Text(randomizedQuestions[currentQuestionIndex].text)
                TextField("Enter your answer", text: $answerInput)
                    .keyboardType(.numberPad)
                    .onSubmit {
                        if let userAnswer = Int(answerInput) {
                            self.userAnswer(userAnswer)
                        }
                    }
            }
            
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: nextQuestion)
            } message: {
                Text("Your score is \(userScores)")
            }
            .alert("Final Score", isPresented: $showingFinalScore) {
                Button("Finish", action: resetGame)
            } message: {
                Text("Your final score is \(userScores) out of \(questionsInput)")
            }
        }
            
    }
}
#Preview {
    PracticeView(
        questionsInput: 5,         // Number of questions
        modeInput: "easy",         // Difficulty level
        tableStart: 2,             // Starting multiplication table
        tableEnd: 5                // Ending multiplication table
    )
}
