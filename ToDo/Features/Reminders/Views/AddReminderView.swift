//
//  AddReminderView.swift
//  ToDo
//
//  Created by Nnéna Okrs on 19/07/2023.
//

import SwiftUI

struct AddReminderView: View {
    
    enum FocusableField: Hashable {
        case title
    }
    
    @FocusState private var focusedField: FocusableField?
    
    @State private var reminder = Reminder(title: "")
    
    @Environment(\.dismiss) private var dismiss
    
    var onCommit: (_ reminder: Reminder) -> Void
    
    private func commit() {
        onCommit(reminder)
        dismiss()
    }
    
    private func cancel() {
        dismiss()
    }
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Reminder", text: $reminder.title)
                    .focused($focusedField, equals: .title)
            }
            .navigationTitle("New Reminder")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: cancel) {
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .confirmationAction){
                    Button(action: commit) {
                        Text("Add")
                    }
                    .disabled(reminder.title.isEmpty)
                }
            }
            .onAppear{
                focusedField = .title
            }
        }
    }
}

struct AddReminderView_Previews: PreviewProvider {
    static var previews: some View {
        AddReminderView{reminder in
            print("You added a new reminder titled\(reminder.title)")
        }
    }
}
