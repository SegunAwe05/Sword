//
//  NotificationView.swift
//  Sword
//
//  Created by Segun Awe on 1/27/23.
//

import SwiftUI

struct NotificationView: View {
    @State var reminder = Date()
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
                Text("What time would you like us to remind you about your memory verse ?")
                    .font(.title3)
                    .foregroundColor(Color("Text-Purple"))
                    .padding()
          
                Spacer().frame(height: 70)
                DatePicker("Please choose a time", selection: $reminder, displayedComponents: .hourAndMinute)
                    
                    .padding()
                    .foregroundColor(Color("Text-Purple"))
                Spacer().frame(height: 80)
                Button {
                    
                } label: {
                    Text("Save")
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
        NotificationView()
    }
}
