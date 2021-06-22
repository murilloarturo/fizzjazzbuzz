//
//  LogViewModel.swift
//  SingleViewTest
//
//  Created by Arturo on 6/20/21.
//

import Foundation

final class LogViewModel {
    let userDefaultsManager = UserDefaultsManager()
    
    func getLogs() -> [LogEntry] {
        return userDefaultsManager.getLog()
    }
}
