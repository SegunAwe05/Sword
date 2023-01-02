//
//  PostView.swift
//  Sword
//
//  Created by Segun Awe on 1/2/23.
//

import SwiftUI

struct PostView: View {
    @State var scripture = ""
    @State var verse = "Matthew 6:33"
    
    var body: some View {
        ZStack {
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(Color("Main-Purple"))
            ScrollView {
                VStack(spacing: 15) {
                    Spacer().frame(height: 30)
                    Text("Add your memory verse!")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color("Text-Purple"))
                        .padding()
                    
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
                    
                    Button {
                        // add tp yea
                    } label: {
                        Text("Add Verse")
                            .foregroundColor(Color("Text-Purple"))
                            .frame(width: 200)
                            .padding()
                            .background(Color("Card-Purple"))
                            .cornerRadius(10)
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
