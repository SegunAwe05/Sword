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
    var body: some View {
        Button {
            print(topic)
            check.toggle()
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
        CategoryButton(topic: "Love")
    }
}
