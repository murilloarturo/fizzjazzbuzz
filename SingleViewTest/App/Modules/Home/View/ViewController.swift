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
    }

    func calculateNumbers() {
        guard let text = inputTextField.text else {
            //there is no text to process
            return
        }

        if let response = viewModel.tryToCalulateNumbers(with: text) {
            textView.text = response
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
