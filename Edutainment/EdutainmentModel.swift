//
//  EdutainmentModel.swift
//  Edutainment
//
//  Created by Ellie on 9/19/24.
//
//
//import Foundation
//
//private var questionsNumber = [5, 10, 20]
//private var questionsInput = 5
//private var questionNumber = 0
//private var modeInput = "easy"
//private var howDifficult = ["easy", "medium", "hard"]
//private var tableStart = 2 // Starting multiplication table
//private var tableEnd = 5 // Ending multiplication table
//
//private var answerInput = ""
//private var randomizedQuestions = [Question]() // Holds filtered and randomized questions
//private var currentQuestionIndex = 0
//
//private var scoreTitle = ""
//private var userScores = 0
//private var showingScore = false
//private var showingFinalScore = false
//
//var correctAnswer: Int { randomizedQuestions[currentQuestionIndex].answer }
//func setupQuestions() {
//    let allQuestions = Question.askQuestions()
//    
//    // Filter questions based on the selected multiplication table range (tableStart to tableEnd)
//    let filteredByTableRange = allQuestions.filter { question in
//        let table = Int(question.text.split(separator: "×")[0].trimmingCharacters(in: .whitespaces)) ?? 0
//        return table >= tableStart && table <= tableEnd
//    }
//    
//    // Apply further filtering based on difficulty level
//    switch modeInput {
//    case "easy":
//        randomizedQuestions = Array(filteredByTableRange.filter { question in
//            let multiplier = Int(question.text.split(separator: "×")[1].trimmingCharacters(in: .whitespaces)) ?? 0
//            return multiplier <= 5 // Easy mode focuses on smaller multipliers (1-5)
//        }.prefix(questionsInput))
//        
//    case "medium":
//        randomizedQuestions = Array(filteredByTableRange.filter { question in
//            let multiplier = Int(question.text.split(separator: "×")[1].trimmingCharacters(in: .whitespaces)) ?? 0
//            return multiplier > 5 && multiplier <= 9 // Medium mode (multipliers 6-9)
//        }.prefix(questionsInput))
//        
//    case "hard":
//        randomizedQuestions = Array(filteredByTableRange.filter { question in
//            let multiplier = Int(question.text.split(separator: "×")[1].trimmingCharacters(in: .whitespaces)) ?? 0
//            return multiplier >= 10 // Hard mode (multipliers 10-12)
//        }.prefix(questionsInput))
//        
//    default:
//        randomizedQuestions = Array(filteredByTableRange.prefix(questionsInput))
//    }
//    
//    // Reset game state
//    currentQuestionIndex = 0
//    questionNumber = 0
//    answerInput = ""
//    userScores = 0
//}
//
//func resetGame() {
//    currentQuestionIndex = 0
//    questionNumber = 0
//    answerInput = ""
//    userScores = 0
//}
//
//func userAnswer(_ number: Int) {
//    if number == correctAnswer {
//        scoreTitle = "Correct"
//        userScores += 1
//    } else {
//        scoreTitle = "Incorrect! The correct answer is \(correctAnswer)"
//    }
//    
//    if questionNumber < questionsInput - 1 {
//        questionNumber += 1
//        showingScore = true
//    } else {
//        showingFinalScore = true
//    }
//}
//
//func nextQuestion() {
//    if currentQuestionIndex < randomizedQuestions.count - 1 {
//        currentQuestionIndex += 1
//    }
//    answerInput = ""
//}
