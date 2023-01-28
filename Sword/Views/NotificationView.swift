//
//  NotificationView.swift
//  Sword
//
//  Created by Segun Awe on 1/27/23.
//

import SwiftUI

struct NotificationView: View {
    @State var reminder = Date()
    @StateObject var vm = UserStatsViewModel()
    @Binding var isNotificationView: Bool
    var body: some View {
        ZStack {
            Color("Main-Purple").edgesIgnoringSafeArea(.all)
            VStack() {
                Spacer().frame(height: 40)
                Text("Schedule your reminder")
                    .font(.title)
                    .bold()
                    .foregroundColor(Color("Text-Purple"))
                    .padding()
                Spacer().frame(height: 100)
                Text( vm.isNotificationSet ? "You currently have notfications set. Would you like to reset?" : "What time would you like us to remind you about your memory verse ?")
                    .font(.title3)
                    .foregroundColor(Color("Text-Purple"))
                    .padding()
          
                Spacer().frame(height: 70)
                if vm.isNotificationSet == false {
                    DatePicker("Please choose a time", selection: $reminder, displayedComponents: .hourAndMinute)
                        .padding()
                        .foregroundColor(Color("Text-Purple"))
                }
               
                Spacer().frame(height: 80)
                Button {
                    if vm.isNotificationSet {
                        vm.cancelNotifications()
                        isNotificationView.toggle()
                    } else {
                        vm.reminderNotification(date: reminder)
                        isNotificationView.toggle()
                    }
                    
                } label: {
                    Text(vm.isNotificationSet ? "Reset" : "Save")
                        .frame(width: 200, height: 40)
                        .foregroundColor(.black)
                        .background(Color("Text-Purple"))
                        .cornerRadius(7)
                }
            Spacer()
            }
        }
    }

}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(isNotificationView: .constant(true))
    }
}
