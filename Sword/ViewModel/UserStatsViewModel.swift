//
//  UserStatsViewModel.swift
//  Sword
//
//  Created by Segun Awe on 1/14/23.
//

import EventKit
import Foundation
import UserNotifications
import NotificationCenter

class UserStatsViewModel: ObservableObject {
   @Published var streak = UserDefaults.standard.integer(forKey: "streak")
    var calendar = Calendar(identifier: .gregorian)
    var currentDate = Date()
    var lastDate = Foundation.UserDefaults.standard.object(forKey: "lastDate") as? Date
    @Published var isNotificationSet = UserDefaults.standard.bool(forKey: "notificationSet")
    
    init() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("Errer \(error)")
            } else {
                print("success")
            }
        }

    }
    

    func checkForStreak() {
        let dayDifference = calendar.numberOfDaysBetween(lastDate ?? currentDate, and: currentDate)
        
        
        if dayDifference == 1 {
            UserDefaults.standard.set(currentDate, forKey: "lastDate")
            streak += 1
            UserDefaults.standard.set(streak, forKey: "streak")
            print("streak continues")
        } else if dayDifference > 0 {
            UserDefaults.standard.set(currentDate, forKey: "lastDate")
            UserDefaults.standard.set(0, forKey: "streak")
            print("streak lost starting from 0")
        } else {
            UserDefaults.standard.set(currentDate, forKey: "lastDate")
            print("never had a streak setting date")
        }
    }
    
    func reminderNotification(date: Date) {
        
        let content = UNMutableNotificationContent()
        content.title = "Hey time to check back in"
        content.subtitle = "Log back in to read your memory verse"
        content.sound = .default
        
        
        let dateCompenents = Calendar.current.dateComponents([.hour, .minute], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateCompenents, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        
        UserDefaults.standard.set(true, forKey: "notificationSet")
        
        print("added reminder notification")
    }
    
    func cancelNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UserDefaults.standard.set(false, forKey: "notificationSet")
    }
}



extension Calendar {
    func numberOfDaysBetween(_ from: Date, and to: Date) -> Int {
        let fromDate = startOfDay(for: from) // <1>
        let toDate = startOfDay(for: to) // <2>
        let numberOfDays = dateComponents([.day], from: fromDate, to: toDate) // <3>
        
        return numberOfDays.day!
    }
}
