//
//  HomeViewModel.swift
//  SingleViewTest
//
//  Created by Arturo on 6/17/21.
//

import UIKit

enum FizzBuzzJazz: String {
    case fizz = "Fizz"
    case buzz = "Buzz"
    case jazz = "Jazz"
}

final class HomeViewModel {
    var userDefaultsManager = UserDefaultsManager()

    func tryToCalulateNumbers(with text: String) -> [String] {
        guard let number = Int(text), number > 0 else {
            //not valid input
            return []
        }

        let numbers = calculateFizzBuzzJazzNumbers(for: number)
        return numbers
    }

    func formatNumbers(numbers: [String]) -> String {
        let result = numbers.joined(separator: ", \n")
        return result
    }

    func calculateFizzBuzzJazzNumbers(for number: Int) -> [String] {
        var response: [String] = []
        for i in 1...number {
            response.append(calculateFizzBuzzJazz(for: i))
        }

        return response
    }

    func calculateFizzBuzzJazz(for number: Int) -> String {
        var result = ""
        if validateNumberIsMultipleOf(number: 3, numberToValidate: number) {
            result += FizzBuzzJazz.fizz.rawValue
        }
        if validateNumberIsMultipleOf(number: 5, numberToValidate: number) {
            result += FizzBuzzJazz.buzz.rawValue
        }
        if validateNumberIsMultipleOf(number: 7, numberToValidate: number) {
            result += FizzBuzzJazz.jazz.rawValue
        }
        return result.isEmpty ? "\(number)" : result
    }

    func validateNumberIsMultipleOf(number: Int, numberToValidate: Int) -> Bool {
        return numberToValidate % number == 0
    }

    func logEntry(_ entry: String) {
        userDefaultsManager.logResult(input: entry)
    }

    func formatString(_ txt: String) -> NSAttributedString {
        let delimiter = ","
        let values = txt.components(separatedBy: delimiter)

        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.center
        let defaultAttributes: [NSAttributedString.Key: Any] = [.paragraphStyle: style,
                                                                .foregroundColor: UIColor.darkGray,
                                                                .font: UIFont.systemFont(ofSize: 16)]
        let highlightedttributes: [NSAttributedString.Key: Any] = [.paragraphStyle: style,
                                                                   .foregroundColor: UIColor.blue,
                                                                   .font: UIFont.boldSystemFont(ofSize: 16)]

        var attributedString = NSMutableAttributedString(string: values[0], attributes: defaultAttributes)

        for i in 1..<values.count {
            let colon = NSMutableAttributedString(string: ",\n", attributes: defaultAttributes)
            attributedString.append(colon)
            let attributes = isFizzBuzzJazzInValue(value: values[i]) ? highlightedttributes : defaultAttributes
            let valueAttributed = NSMutableAttributedString(string: values[i], attributes: attributes)
            attributedString.append(valueAttributed)
        }
        let braketsRange = NSRange(location: attributedString.length - 1, length: 1)
        let closingBrakets = NSMutableAttributedString(string: "]", attributes: defaultAttributes)
        attributedString.replaceCharacters(in: braketsRange, with: closingBrakets)
        return attributedString
    }

    func isFizzBuzzJazzInValue(value: String) -> Bool {
        return value.contains(FizzBuzzJazz.fizz.rawValue) ||
               value.contains(FizzBuzzJazz.buzz.rawValue) ||
               value.contains(FizzBuzzJazz.jazz.rawValue)
    }
}
