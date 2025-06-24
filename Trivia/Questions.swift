//
//  Questions.swift
//  Trivia
//
//  Created by Aldo Ruiz Parra on 6/23/25.
//

import Foundation
import UIKit


struct Question {
    let question: String
    let options: [String]
    let correctAnswerIndex: Int
}

enum TriviaSet {
    static let sampleQuestions: [Question] = [
        Question(
            question: "What is the supreme law of the land?",
            options: [
                "The Declaration of Independence",
                "The Articles of Confederation",
                "The Constitution",
                "The Emancipation Proclamation"
            ],
            correctAnswerIndex: 2
        ),
        Question(
            question: "Who was the first President of the United States?",
            options: [
                "George Washington",
                "Abraham Lincoln",
                "John Adams",
                "Thomas Jefferson"
            ],
            correctAnswerIndex: 0
        ),
        Question(
            question: "What is one right from the First Amendment?",
            options: [
                "Bear arms",
                "A fair trial",
                "Vote",
                "Speech"
            ],
            correctAnswerIndex: 3
        )
    ]
}
