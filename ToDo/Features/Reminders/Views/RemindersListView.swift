//
//  RemindersListView.swift
//  ToDo
//
//  Created by Nnéna Okrs on 18/07/2023.
//

import SwiftUI

struct RemindersListView: View {
    
    @StateObject private var viewModel = RemindersListVM()
    
    @State private var reminders = Reminder.samples // ?
    @State private var isAddReminderDialogPresented = false
    
    private func presentAddReminderView() {
        isAddReminderDialogPresented.toggle()
    }
    
    var body: some View {
        List($reminders) { $reminder in
            RemindersListRowView(reminder: $reminder)
        }
        .toolbar{
            ToolbarItemGroup(placement: .bottomBar) {
                Button(action: presentAddReminderView) {
                    HStack{
                        Image(systemName: "plus.circle.fill")
                        Text("New Reminder")
                    }
                }
                Spacer()
            }
        }
        .sheet(isPresented: $isAddReminderDialogPresented) {
            AddReminderView{reminder in
                viewModel.addReminder(reminder)
            }
        }
        .tint(.orange) // Pourquoi mon toggle est pas orange aussi??
    }
}

struct RemindersListView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            RemindersListView()
        }
    }
}
