//
//  ContentView.swift
//  Sword
//
//  Created by Segun Awe on 12/29/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = verseViewModel()
    @StateObject var statsVM = UserStatsViewModel()
    @State var addView = false
    @State var editView = false
    @State var searchText = ""
    @State var isTopicFilter = false
    @State var topicSearch = ""
    @State var isNotificationView = false
    @State var scripture = ""
    @State var verse = ""
    
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
                        
                        Button {
                            isNotificationView.toggle()
                        } label: {
                            Image(systemName: "bell")
                                .padding()
                                .font(.system(size: 25))
                                .foregroundColor(Color("Text-Purple"))
                        }
                        
                    }
                    
                    HStack {
                        Spacer()
                        Text("You're on a \(statsVM.streak) day streak!")
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
                    
                    ScrollView(showsIndicators: false) {
                        ForEach(Array(vm.savedVerses.filter({($0.verse?.localizedCaseInsensitiveContains(searchText))! || searchText.isEmpty }).reversed().enumerated()), id: \.element) {  index, value in
                            
                            // checking if filter is active
                            if  isTopicFilter == true {
                                if value.topics!.contains(topicSearch) {
                                    
                                    NavigationLink(destination: DetailView(scripture: value.scripture!, verse: value.verse!,  topics: value.topics!, vm: vm, entity: value)) {
                                        CardView(scripture: value.scripture ?? "NA", verse: value.verse ?? "No verse", topicsArr: value.topics ?? [""])
                                            .multilineTextAlignment(.leading)
                                            .contextMenu {
                                                Button {
                                                    // add set favorite for widget kit
                                                } label: {
                                                    Label("Set as verse of the week", systemImage: "star")
                                                }
                                                Button(role: .destructive) {
                                                    // add delete function
                                                } label: {
                                                    Label("Delete", systemImage: "trash")
                                                        
                                                }
                                            } preview: {
                                                CardView(scripture: value.scripture ?? "NA", verse: value.verse ?? "No verse", topicsArr: value.topics ?? [""])
                                            }
                                         
                                    }
                                    Spacer().frame(height: 15)
                                }
                            } else {
                                NavigationLink(destination: DetailView(scripture: value.scripture!, verse: value.verse!,  topics: value.topics!, vm: vm, entity: value)) {
                                    CardView(scripture: value.scripture ?? "NA", verse: value.verse ?? "No verse", topicsArr: value.topics ?? [""])
                                        .multilineTextAlignment(.leading)
                                        .contextMenu {
                                            Button {
                                                // add set favorite for widget kit
                                            } label: {
                                                Label("Set as verse of the week", systemImage: "star")
                                            }
                                            Button(role: .destructive) {
                                                // add delete function
                                            } label: {
                                                Label("Delete", systemImage: "trash")
                                                   
                                            }
                                        } preview: {
                                            CardView(scripture: value.scripture ?? "NA", verse: value.verse ?? "No verse", topicsArr: value.topics ?? [""])
                                        }
                                     
                                }
                                Spacer().frame(height: 15)
                            }
                        }
                       
                    }
                    
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
                
                    .popover(isPresented: $isNotificationView) {
                        
                        NotificationView(isNotificationView: $isNotificationView)
                    }
                
            }
        }.onAppear {
            statsVM.checkForStreak()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
