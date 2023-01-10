//
//  CategoryButton.swift
//  Sword
//
//  Created by Segun Awe on 1/2/23.
//

import SwiftUI

struct CategoryButton: View {
    @State var check = false
    var topic: String
    @Binding var topics: [String]
    var body: some View {
        Button {
            check.toggle()
            
            if check == true {  // selecting and diselecting from list
                topics.append(topic)
            } else if topics.contains(topic) {
                topics.removeAll{$0 == topic}
            }
            print(topics)
            
        } label: {
            Text(topic)
                .padding()
                .background(check ? Color.green : Color("Text-Purple"))
                .foregroundColor(.black)
                .cornerRadius(7)
        }
    }
}

struct CategoryButton_Previews: PreviewProvider {
    static var previews: some View {
        CategoryButton(topic: "Love", topics: .constant([""]))
    }
}
