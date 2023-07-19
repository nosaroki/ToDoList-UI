//
//  RemindersListRowView.swift
//  ToDo
//
//  Created by Nnéna Okrs on 19/07/2023.
//

import SwiftUI

struct RemindersListRowView: View {
    
    @Binding var reminder : Reminder
    
    var body: some View {
        HStack {
            Toggle(isOn: $reminder.isCompleted) {}
                .toggleStyle(.reminder)
            Text(reminder.title)
        }
    }
}

struct RemindersListRowView_Previews: PreviewProvider {
    
    struct Container: View {
        var body: some View{
            List{
                RemindersListRowView(reminder: .constant(Reminder.samples[0]))
            }
            .listStyle(.plain)
        }
    }
    
    static var previews: some View {
        NavigationView {
            Container()
                .listStyle(.plain)
                .navigationTitle("Reminders")
        }
    }
}
