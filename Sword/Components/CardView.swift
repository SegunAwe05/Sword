//
//  CardView.swift
//  Sword
//
//  Created by Segun Awe on 12/29/22.
//

import SwiftUI

struct CardView: View {
    var scripture: String
    var verse: String
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("\"\(scripture)\"")
                .foregroundColor(Color("Text-Purple"))
            HStack {
                Text("Matthew 6:33")
                    .foregroundColor(Color("Text-Purple"))
                Spacer()
                Text("Hope")
                    .padding(4)
                    .background(Color("Text-Purple"))
                    .foregroundColor(.black)
                    .cornerRadius(7)
                Text("Love")
                    .padding(4)
                    .background(Color("Text-Purple"))
                    .foregroundColor(.black)
                    .cornerRadius(7)
                Text("Anxiety")
                    .padding(4)
                    .background(Color("Text-Purple"))
                    .foregroundColor(.black)
                    .cornerRadius(7)
            }
           
            
            
        }.frame(width: 350)
            .padding()
            .background(Color("Card-Purple"))
            .cornerRadius(10)
        
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(scripture: "Seek the Kingdom of God above all else, and live righteously, and he will give you everything you need.", verse: "Matthew 6:33")
    }
}
