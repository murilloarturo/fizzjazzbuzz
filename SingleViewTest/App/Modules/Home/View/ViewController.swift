//
//  ViewController.swift
//  SingleViewTest
//
//  Created by Arturo on 6/17/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var inputTextField: UITextField!
    @IBOutlet weak var textView: UITextView!
    private let viewModel = HomeViewModel()
    private let dataSource = HomeDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    @IBAction func didTapCalculate(_ sender: Any) {
        calculateNumbers()
    }
}

private extension ViewController {
    func setup() {
        inputTextField.delegate = self
        title = "FizzBuzzJazz"
    }

    func calculateNumbers() {
        guard let text = inputTextField.text else {
            //there is no text to process
            return
        }

        viewModel.logEntry(text)

        let response = viewModel.tryToCalulateNumbers(with: text)
        if !response.isEmpty {
            let formattedString = viewModel.formatString(response.description)
            textView.attributedText = formattedString
        } else {
            textView.text = "Try another number!!"
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        calculateNumbers()
        return true
    }
}
