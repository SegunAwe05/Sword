//
//  ContentView.swift
//  Sword
//
//  Created by Segun Awe on 12/29/22.
//

import SwiftUI

struct ContentView: View {
    @State var tempList = ["Give all your worries and cares to God, for he cares about you.",
                           "Don’t worry about anything; instead, pray about everything.",
                           "Seek the Kingdom of God above all else, and live righteously, and he will give you everything you need."]
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("Main-Purple"))
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                HStack {
                    Text("Welcome, Segun")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color("Text-Purple"))
                        .padding()
                    Spacer()
                }

                HStack {
                    Spacer()
                    Text("You're on a 3 day streak!")
                        .foregroundColor(Color("Text-Purple"))
                        .padding()
                }
                Spacer()
                List() {
                    ForEach(tempList, id: \.self) { value in
                        CardView(verse: value)
                            
                    }.listRowBackground(Color("Main-Purple"))
                        .listRowSeparator(.hidden)
                    
                }.listStyle(PlainListStyle())
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
