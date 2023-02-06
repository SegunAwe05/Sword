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
    var topicsArr: [String]
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("\"\(scripture)\"")
                .foregroundColor(Color("Text-Purple"))
            HStack {
                Text(verse)
                    .foregroundColor(Color("Text-Purple"))
                Spacer()
                ForEach(topicsArr, id: \.self) { topic in
                    Text(topic)
                        .padding(4)
                        .background(Color("Text-Purple"))
                        .foregroundColor(.black)
                        .cornerRadius(7)
                        .multilineTextAlignment(.leading)
                }
               
 
            }
        }.frame(width: 350)
            .padding()
            .background(Color("Card-Purple"))
            .cornerRadius(10)
        
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(scripture: "Seek the Kingdom of God above all else, and live righteously, and he will give you everything you need.", verse: "Matthew 6:33", topicsArr: ["Love", "Joy", "Peace"])
    }
}
