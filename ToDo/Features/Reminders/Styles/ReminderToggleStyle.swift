//
//  ReminderToggleStyle.swift
//  ToDo
//
//  Created by Nnéna Okrs on 19/07/2023.
//

import SwiftUI

struct ReminderToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack{
            Image(systemName: configuration.isOn ? "largecircle.fill.circle" : "circle")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(configuration.isOn ? .accentColor: .gray)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            configuration.label
        }
    }
}

// Pourquoi faire?
extension ToggleStyle where Self == ReminderToggleStyle{
    static var reminder: ReminderToggleStyle {
        ReminderToggleStyle()
    }
}

struct ReminderToggleStyle_Previews: PreviewProvider {
    
    struct Container: View {
        @State var isOn = false
        var body: some View{
            Toggle(isOn: .constant(true)) {Text("Hello")}
                        .toggleStyle(ReminderToggleStyle())
        }
    }
    
    
    static var previews: some View {
        Container()
    }
}
