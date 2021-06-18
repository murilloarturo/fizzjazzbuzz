//
//  HomeViewModel.swift
//  SingleViewTest
//
//  Created by Arturo on 6/17/21.
//

import Foundation

enum NumberType {
    case regularNumber(Int)
    case fizz
    case buzz
    case jazz
    case fizzBuzz
    case fizzJazz
    case buzzJazz
    case fizzBuzzJazz

    var titleString: String {
        switch self {
        case .fizzBuzzJazz:
            return "FizzBuzzJazz"
        case .buzzJazz:
            return "BuzzJazz"
        case .fizzJazz:
            return "FizzJazz"
        case .fizzBuzz:
            return "FizzBuzz"
        case .jazz:
            return "Jazz"
        case .buzz:
            return "Buzz"
        case .fizz:
            return "Fizz"
        case .regularNumber(let number):
            return "\(number)"
        }
    }
}

final class HomeViewModel {
    func tryToCalulateNumbers(with text: String) -> String? {
        guard let number = Int(text), number > 0 else {
            //not valid input
            return nil
        }

        let numbers = calculateNumbers(with: number)
        return formatNumbers(numbers: numbers)
    }

    func formatNumbers(numbers: [NumberType]) -> String {
        var result = numbers.map{ $0.titleString }.joined(separator: ", \n")
        return result
    }

    func calculateNumbers(with number: Int) -> [NumberType] {
        var response: [NumberType] = []
        for i in 1...number {
            response.append(calculateSingleNumber(with: i))
        }

        return response
    }

    func calculateSingleNumber(with number: Int) -> NumberType {
        let isMultipleOfThree = validateNumberIsMultipleOf(number: 3, numberToValidate: number)
        let isMultipleOfFive = validateNumberIsMultipleOf(number: 5, numberToValidate: number)
        let isMultipleOfSeven = validateNumberIsMultipleOf(number: 7, numberToValidate: number)

        if isMultipleOfSeven && isMultipleOfFive && isMultipleOfThree {
            return .fizzBuzzJazz
        } else if isMultipleOfFive && isMultipleOfSeven {
            return .buzzJazz
        } else if isMultipleOfFive && isMultipleOfThree {
            return .fizzBuzz
        } else if isMultipleOfSeven && isMultipleOfThree {
            return .fizzJazz
        } else if isMultipleOfSeven {
            return .jazz
        } else if isMultipleOfFive {
            return .buzz
        } else if isMultipleOfThree {
            return .fizz
        } else {
            return .regularNumber(number)
        }
    }

    func validateNumberIsMultipleOf(number: Int, numberToValidate: Int) -> Bool {
        return numberToValidate % number == 0
    }
}
