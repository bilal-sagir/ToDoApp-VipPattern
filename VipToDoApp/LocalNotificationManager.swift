//
//  LocalNotificationManager.swift
//  VipToDoApp
//
//  Created by Bilal on 11.02.2022.
//

import UserNotifications

class LocalNotificationManager{
    class func addNewNoti(item: Item) -> Void {
        let notiContent = UNMutableNotificationContent()
        
        notiContent.title = "‼️Time is Up‼️"
        notiContent.subtitle = item.title!
        notiContent.body = item.detail!
        
        notiContent.sound = UNNotificationSound.default
        
        let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: item.date!)
        let dateTrigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        
        let identifier = item.title
        let req = UNNotificationRequest(identifier: identifier!, content: notiContent, trigger: dateTrigger)
        UNUserNotificationCenter.current().add(req, withCompletionHandler: nil)
    }
}
