//
//  UserDefaultsManager.swift
//  SingleViewTest
//
//  Created by Arturo on 6/17/21.
//

import Foundation

final class UserDefaultsManager {
    var appLogKey = "app_log_key"
    let defaults = UserDefaults.standard

    func logResult(input: String) {
        let entry = LogEntry(date: Date(), input: input)

        var currentLog = getLog()
        currentLog.insert(entry, at: 0)
        saveLog(logToSave: currentLog)
    }

    func getLog() -> [LogEntry] {
        guard let savedLogs = defaults.object(forKey: appLogKey) as? Data else { return [] }
        let decoder = JSONDecoder()
        return (try? decoder.decode([LogEntry].self, from: savedLogs)) ?? []
    }

    func saveLog(logToSave: [LogEntry]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(logToSave) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: appLogKey)
        }
    }
}

struct LogEntry: Codable {
    var date: Date
    var input: String

    var dateFormatted: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy hh:mm:ss"
        return formatter.string(from: date)
    }
}
