//
//  Reminder.swift
//  ToDo
//
//  Created by Nnéna Okrs on 18/07/2023.
//

import Foundation

struct Reminder: Identifiable {
    let id = UUID()
    var title : String
    var isCompleted = false
}

extension Reminder {
    static let samples = [
        Reminder(title: "Build sample app", isCompleted: true),
        Reminder(title: "Practice React daily"),
        Reminder(title: "Redo my CV"),
        Reminder(title: "Sit back, relax, enjoy the show")
    ]
}
