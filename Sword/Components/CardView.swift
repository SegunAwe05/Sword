//
//  CardView.swift
//  Sword
//
//  Created by Segun Awe on 12/29/22.
//

import SwiftUI

struct CardView: View {
    var verse: String
    var body: some View {
//        VStack {
            Text(verse)
                .foregroundColor(Color("Text-Purple"))
                .frame(width: 350)
                .padding()
                .background(Color("Card-Purple"))
                .cornerRadius(10)
        
//                .padding()
                
//            Text("Matthew 6:33")
//                .foregroundColor(Color("Text-Purple"))
//                .padding()
            
//        }.padding()
       
            
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(verse: "Seek the Kingdom of God above all else, and live righteously, and he will give you everything you need.")
    }
}
