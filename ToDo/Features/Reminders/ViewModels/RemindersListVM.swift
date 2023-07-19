//
//  RemindersListVM.swift
//  ToDo
//
//  Created by Nnéna Okrs on 19/07/2023.
//

import Foundation

class RemindersListVM: ObservableObject{
    @Published
    var reminders = Reminder.samples
    
    func addReminder(_ reminder: Reminder) {
        reminders.append(reminder)
    }
    
    func toggleCompleted (_ reminder: Reminder) {
        if let index = reminders.firstIndex(where: {$0.id == reminder.id}) {
            reminders[index].isCompleted.toggle()
        }
    }
}
