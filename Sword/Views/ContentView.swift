//
//  ContentView.swift
//  Sword
//
//  Created by Segun Awe on 12/29/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = verseViewModel()
    @State var addView = false
    @State var searchText = ""
    @State var isTopicFilter = false
    @State var topicSearch = ""
    var categories = ["Love", "Anxiety", "Healing", "Anger", "Hope", "Fear", "Peace", "Stress", "Patience", "Loss", "Joy", "Temptation", "Pride", "Doubt"]
    
    func dismissKey() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                
                Color("Main-Purple").edgesIgnoringSafeArea(.all)
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
                                TopicFilterView(isTopicFilter: $isTopicFilter, topicSearch: $topicSearch, topic: item)
                            }
                        }.padding(.horizontal)
                    }
                    
                    
                    List() {
                        ForEach(vm.savedVerses.filter({($0.verse?.localizedCaseInsensitiveContains(searchText))! || searchText.isEmpty }).reversed()) { value in
                            
                            // checking if filter is active
                            if  isTopicFilter == true {
                                if value.topics!.contains(topicSearch) {
                                    CardView(scripture: value.scripture ?? "NA", verse: value.verse ?? "No verse", topicsArr: value.topics ?? [""])
                                }
                            } else {
                                CardView(scripture: value.scripture ?? "NA", verse: value.verse ?? "No verse", topicsArr: value.topics ?? [""])
                            }
                            
                        }.onDelete(perform: vm.listSwipeDelete)
                        .listRowBackground(Color("Main-Purple"))
                            .listRowSeparator(.hidden)
                        
                    }.listStyle(.plain)
                        .background(Color("Main-Purple"))
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
                        PostView(vm: vm, addView: $addView)
                    }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
