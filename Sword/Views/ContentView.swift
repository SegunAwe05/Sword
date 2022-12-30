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
                           "Seek the Kingdom of God above all else, and live righteously, and he will give you everything you need.",
                           "Keep on asking, and you will receive what you ask for. Keep on seeking, and you will find. Keep on knocking, and the door will be opened to you. 8 For everyone who asks, receives. Everyone who seeks, finds. And to everyone who knocks, the door will be opened"]
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
                        CardView(scripture: value, verse: "Mathew 6:33")
                            
                    }.listRowBackground(Color("Main-Purple"))
                        .listRowSeparator(.hidden)
                    
                }.listStyle(PlainListStyle())
            }
            
            // the button
                    VStack{
                        Spacer()
                        HStack {
                            Spacer()
                            Button {
//                                addButton.toggle()
                            } label: {
                                Image(systemName: "plus")
                                    .foregroundColor(Color("Text-Purple"))
                                    .font(.system(size: 35))
                            }.padding(8)
                                .background(Color.black)
                                .clipShape(Circle())
                        }.padding(.trailing, 25)
                    }.padding(.bottom, 20)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
