//
//  PostView.swift
//  Sword
//
//  Created by Segun Awe on 1/2/23.
//

import SwiftUI

struct PostView: View {
    @State var scripture = ""
    @State var verse = ""
    var categories = ["Love", "Anxiety", "Healing", "Anger", "Hope", "Fear", "Peace", "Stress", "Patience", "Loss", "Joy", "Temptation", "Pride", "Doubt"]
    @ObservedObject var vm: verseViewModel
    @State var topics = [String]()
    @State var alertToggle = false
    @Binding var addView: Bool
    
    func dismissKey() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(Color("Main-Purple"))
            ScrollView(showsIndicators: false) {
                VStack(spacing: 15) {
                    Spacer().frame(height: 30)
                    Text("Add your memory verse!")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color("Text-Purple"))
                        .padding()
                    
                    // MARK: Textfields
                    HStack {
                        Text("Scripture")
                            .foregroundColor(Color("Text-Purple"))
                            .padding()
                        Spacer()
                    }
                    
                    TextField("", text: $scripture, axis: .vertical)
                        .foregroundColor(Color("Text-Purple"))
                        .lineLimit(5...)
                        .frame(width: 350)
                        .padding()
                        .background(Color("Card-Purple"))
                        .cornerRadius(15)
                    
                    HStack {
                        Text("Verse")
                            .foregroundColor(Color("Text-Purple"))
                            .padding()
                        Spacer()
                    }
                    
                    TextField("", text: $verse, axis: .vertical)
                        .foregroundColor(Color("Text-Purple"))
                        .frame(width: 350)
                        .padding()
                        .background(Color("Card-Purple"))
                        .cornerRadius(15)
                    Spacer()
                    
                    // MARK: This is where categories start
                    Group {
                        Text("Categories")
                            .font(.title2)
                            .bold()
                            .foregroundColor(Color("Text-Purple"))
                            .padding()
                        Text("(Select at least 3)")
                            .foregroundColor(Color("Text-Purple"))
                        
                        HStack {
                            ForEach(categories[0...3], id: \.self) { item in
                                CategoryButton(topic: item, topics: $topics)
                            }
                        }
                        
                        HStack {
                            ForEach(categories[4...6], id: \.self) { item in
                                CategoryButton(topic: item, topics: $topics)
                            }
                        }
                        
                        HStack {
                            ForEach(categories[7...10], id: \.self) { item in
                                CategoryButton(topic: item, topics: $topics)
                            }
                        }
                        HStack {
                            ForEach(categories[11...13], id: \.self) { item in
                                CategoryButton(topic: item, topics: $topics)
                            }
                        }
                    }
                    
                    Spacer()
                }
            }
            .alert(isPresented: $alertToggle) {
                Alert(title: Text("Cannot Save"), message: Text("Please fill in all text fields"), dismissButton: .default(Text("Ok")))
            }
            
            // MARK: Add button
            VStack{
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        if verse.isEmpty || scripture.isEmpty {
                            alertToggle.toggle()
                        } else {
                            vm.addVerse(verse: verse, scripture: scripture, topics: topics)
                            verse = ""
                            scripture = ""
                            addView = false
                        }
                        
                        
                    } label: {
                        Image(systemName: "checkmark")
                            .foregroundColor(Color("Text-Purple"))
                            .font(.system(size: 35))
                    }.padding(8)
                        .background(Color.black)
                        .clipShape(Circle())
                }.padding(.trailing, 25)
            }.padding(.bottom, 20)
        }.onTapGesture {
            dismissKey()
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(vm: verseViewModel(), addView: .constant(false))
    }
}
