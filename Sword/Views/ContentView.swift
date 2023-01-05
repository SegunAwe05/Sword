//
//  ContentView.swift
//  Sword
//
//  Created by Segun Awe on 12/29/22.
//

import SwiftUI

struct ContentView: View {
    @State var addView = false
    @State var searchText = ""
    @State var tempList = ["Give all your worries and cares to God, for he cares about you.",
                           "Don’t worry about anything; instead, pray about everything.",
                           "Seek the Kingdom of God above all else, and live righteously, and he will give you everything you need.",
                           "Keep on asking, and you will receive what you ask for. Keep on seeking, and you will find. Keep on knocking, and the door will be opened to you. 8 For everyone who asks, receives. Everyone who seeks, finds. And to everyone who knocks, the door will be opened"]
    var categories = ["Love", "Anxiety", "Healing", "Anger", "Hope", "Fear", "Peace", "Stress", "Patience", "Loss", "Joy", "Temptation", "Pride", "Doubt"]
    
    func dismissKey() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("Main-Purple"))
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    dismissKey()
                }
            VStack(spacing: 10) {
                HStack {
                    Text("Welcome back!")
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
                
                SearchBar(text: $searchText)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(categories, id: \.self) { item in
                            Button {
                                // filter somehow
                            } label: {
                                Text(item)
                                    .padding(10)
                                    .background(Color("Card-Purple"))
                                    .foregroundColor(Color("Text-Purple"))
                                    .cornerRadius(7)
                            }
                        }
                    }.padding(.horizontal)
                }
                
                
                List() {
                    ForEach(tempList, id: \.self) { value in
                        CardView(scripture: value, verse: "Mathew 6:33")
                            
                    }.listRowBackground(Color("Main-Purple"))
                        .listRowSeparator(.hidden)
                    
                }.listStyle(PlainListStyle())
                    .onTapGesture {
                        dismissKey()
                    }
            }
            
            // the button
                    VStack{
                        Spacer()
                        HStack {
                            Spacer()
                            Button {
                                addView.toggle()
                            } label: {
                                Image(systemName: "plus")
                                    .foregroundColor(Color("Text-Purple"))
                                    .font(.system(size: 35))
                            }.padding(8)
                                .background(Color.black)
                                .clipShape(Circle())
                        }.padding(.trailing, 25)
                    }.padding(.bottom, 20)
            
                .sheet(isPresented: $addView) {
                    PostView()
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
