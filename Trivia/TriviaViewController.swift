//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Aldo Ruiz Parra on 6/23/25.
//

import UIKit

class TriviaViewController: UIViewController {

    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    private var correctAnswers = 0
    
    private var currentQuestionIndex = 0
    private var questions: [Question] = TriviaSet.sampleQuestions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    private func updateUI() {
    let question = questions[currentQuestionIndex]
        questionLabel.text = question.question
        progressLabel.text = "Question \(currentQuestionIndex + 1) of \(questions.count)"
        answerButton1.setTitle(question.options[0], for: .normal)
        answerButton2.setTitle(question.options[1], for: .normal)
        answerButton3.setTitle(question.options[2], for: .normal)
        answerButton4.setTitle(question.options[3], for: .normal)

        // Reset button colors and enable all
        [answerButton1, answerButton2, answerButton3, answerButton4].forEach {
            $0.backgroundColor = .systemBlue
            $0.isEnabled = true
        }
//        let question = questions[currentQuestionIndex]
//        questionLabel.text = question.question
//        progressLabel.text = "Question \(currentQuestionIndex + 1) of \(questions.count)"
//        answerButton1.setTitle(question.options[0], for: .normal)
//        answerButton2.setTitle(question.options[1], for: .normal)
//        answerButton3.setTitle(question.options[2], for: .normal)
//        answerButton4.setTitle(question.options[3], for: .normal)
//        
//        // Enable buttons in case they were disabled after a previous tap
//        [answerButton1, answerButton2, answerButton3, answerButton4].forEach {
//            $0.isHidden = false
//            $0.isEnabled = true
//            $0.backgroundColor = .systemBlue // Reset color
//        }
    }

    @IBAction func answerTapped(_ sender: UIButton) {
//        print("Button tapped")

        let selectedIndex: Int
        
        switch sender {
        case answerButton1: selectedIndex = 0
        case answerButton2: selectedIndex = 1
        case answerButton3: selectedIndex = 2
        case answerButton4: selectedIndex = 3
        default:
            print("Unknown button tapped")
            return
        }

        let correctIndex = questions[currentQuestionIndex].correctAnswerIndex
//        print("Selected Index: \(selectedIndex), Correct Index: \(correctIndex)")

        // Optional visual feedback
        if selectedIndex == correctIndex {
            sender.backgroundColor = .systemGreen
            correctAnswers += 1
        } else {
            sender.backgroundColor = .systemRed
        }

        // Disable all buttons to prevent multiple taps
        [answerButton1, answerButton2, answerButton3, answerButton4].forEach {
            $0.isEnabled = false
        }

        // Move to the next question after a short delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.currentQuestionIndex += 1
            if self.currentQuestionIndex < self.questions.count {
                self.updateUI()
            } else {
                self.questionLabel.text = "Congrats! You got \(self.correctAnswers) out of \(self.questions.count) correct."
                self.progressLabel.text = ""
                [self.answerButton1, self.answerButton2, self.answerButton3, self.answerButton4].forEach {
                    $0.isHidden = true
                }
            }
        }
    }
}
