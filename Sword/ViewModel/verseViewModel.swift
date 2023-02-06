//
//  verseViewModel.swift
//  Sword
//
//  Created by Segun Awe on 1/9/23.
//

import Foundation
import CoreData


class verseViewModel: ObservableObject {
    @Published var savedVerses: [VerseEntity] = []
    let container:  NSPersistentContainer
    
    init() {
         container = NSPersistentContainer(name: "CoreData")
         container.loadPersistentStores { description, error in
             if let error = error {
                 print("Error loading data \(error)")
             }
         }
         fetchVerseData()
     }
    
    func fetchVerseData() {
        let request = NSFetchRequest<VerseEntity>(entityName: "VerseEntity")
               
               do {
                   savedVerses = try container.viewContext.fetch(request)
               } catch let error {
                   print("error fetching \(error)")
               }
    }
    
    func addVerse(verse: String, scripture: String, topics: [String]) {
        let entity = VerseEntity(context: container.viewContext)
        entity.verse = verse
        entity.scripture = scripture
        entity.topics = topics
        saveData()
                    
    }
    
    func deleteVerse(entity: VerseEntity) {
              container.viewContext.delete(entity)
              saveData()
              print("Hello")
          }
    
    func saveEdits(entity: VerseEntity, verse: String, scripture: String, topics: [String]) {
        do {
            entity.verse = verse
            entity.scripture = scripture
            entity.topics = topics
            try container.viewContext.save()
            fetchVerseData()
        } catch {
            container.viewContext.rollback()
            
        }
    }
    
    
    func saveData() {
              do {
                  try container.viewContext.save()
                  fetchVerseData()
              } catch let error {
                  print("error saving \(error)")
              }
          }
    
    
}
