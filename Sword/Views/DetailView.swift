//
//  DetailView.swift
//  Sword
//
//  Created by Segun Awe on 2/5/23.
//

import SwiftUI
import CoreData

struct DetailView: View {
    
    @State var scripture: String
    @State var verse: String
    var categories = ["Love", "Anxiety", "Healing", "Anger", "Hope", "Fear", "Peace", "Stress", "Patience", "Loss", "Joy", "Temptation", "Pride", "Doubt"]
    @ObservedObject var vm: verseViewModel
    @State var topics = [String]()
    @State var alertToggle = false
    @ObservedObject var entity: VerseEntity
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
                    Text("Edit your memory verse!")
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
                            vm.saveEdits(entity: entity, verse: verse, scripture: scripture)
                            print("we are saving edits")
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

//struct DetailView_Previews: PreviewProvider {
//    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
//    static var previews: some View {
//        let entity = VerseEntity(context: moc)
//        entity.scripture = "Love the world"
//        entity.verse = "John 1:1"
//        entity.topics = ["Love", "Joy", "peace"]
//
//        return DetailView(scripture: "", verse: "", vm: verseViewModel(), entity: entity)
//
//
//    }
//}
