//
//  SearchBar.swift
//  Sword
//
//  Created by Segun Awe on 1/5/23.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    @State var isEditing = false
  
    func dismissKey() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    var body: some View {
        HStack {
            TextField("Search Verse", text: $text)
                .padding(7)
                .padding(.horizontal, 35)
                .frame(height: 35)
                .foregroundColor(Color("Text-Purple"))
                .background(Color("Card-Purple"))
                .cornerRadius(10)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(10)
                            .foregroundColor(Color("Text-Purple"))
                        
                        // cancel button
                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(Color("Text-Purple"))
                                    .padding(10)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    isEditing = true
                }
            
            if text != "" {
                Button(action: {
                    dismissKey()
                    isEditing = false
                    self.text = ""
                    
                }) {
                    Text("Cancel")
                        .foregroundColor(Color("Text-Purple"))
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(Animation.easeInOut(duration: 1.0), value: 200.0)
                
            }
        }
    }
}


struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
