//
//  TopicFilterView.swift
//  Sword
//
//  Created by Segun Awe on 1/10/23.
//

import SwiftUI

struct TopicFilterView: View {
    @Binding var isTopicFilter: Bool
    @Binding var topicSearch: String
    @State var isSelected = false
    var topic: String
    
    var body: some View {
        Button {
            isTopicFilter.toggle()
            isSelected.toggle()
            topicSearch = topic
            print(topic)
        } label: {
            Text(topic)
                .padding(10)
                .background(isSelected ? Color("Text-Purple") : Color("Card-Purple"))
                .foregroundColor(isSelected ? Color.black : Color("Text-Purple"))
                .cornerRadius(7)
        }
    }
}

struct TopicFilterView_Previews: PreviewProvider {
    static var previews: some View {
        TopicFilterView(isTopicFilter: .constant(false), topicSearch: .constant(""), topic: "Love")
    }
}
