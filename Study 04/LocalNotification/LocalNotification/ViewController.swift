//
//  ViewController.swift
//  LocalNotification
//
//  Created by 정수현 on 2020/11/20.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Step1 - Ask permission from user
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.badge, .sound, .alert]) { (granted, error) in
            if granted {
                print("Ya!")
            } else {
                print("uu")
            }
        }
        
        // Step2 - Create the notification Centent
        let content = UNMutableNotificationContent()
        content.title = "Hello"
        content.body = "Good Day"
        content.userInfo = ["customData": "aaa"]
        content.sound = .default
        content.badge = 1
        
        // Step3 - Create the notificaiton trigger
        let date = Date().addingTimeInterval(5)
        let dateComponent = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
        
        // Step4 - Create a request
        let uuid = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)
        
        // Step5 - Register with Notificaiton Center
        center.add(request) { (error) in
            // check the erro parameter
        }
    }


}

