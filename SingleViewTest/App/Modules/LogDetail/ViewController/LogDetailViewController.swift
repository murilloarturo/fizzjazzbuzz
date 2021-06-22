//
//  LogDetailViewController.swift
//  SingleViewTest
//
//  Created by Arturo on 6/20/21.
//

import UIKit

class LogDetailViewController: UIViewController {
    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var inputLabel: UILabel!
    private var currentLogEntry: LogEntry?
    private var viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Log Entry"
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        updateUI()
    }

    func updateCurrentLog(with entry: LogEntry) {
        currentLogEntry = entry
    }

    private func updateUI() {
        guard let currentLogEntry = currentLogEntry else { return }
        inputLabel.text = currentLogEntry.input
        dateLabel.text = currentLogEntry.dateFormatted
        let response = viewModel.tryToCalulateNumbers(with: currentLogEntry.input)
        if !response.isEmpty {
            let formattedString = viewModel.formatString(response.description)
            textView.attributedText = formattedString
        } else {
            textView.text = "Try another number!!"
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
