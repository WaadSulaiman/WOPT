//
//  NotisSheet.swift
//  WOPT
//
//  Created by Elmir Abasov on 2021-03-04.
//

import SwiftUI
import UserNotifications

struct NotisSheet: View {
    var body: some View {
        VStack {
            Button("Tillåtelse") {
                // first
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("Allt klart!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            } .padding()
            Button("Schemalagda notiser") {
                // second
                let content = UNMutableNotificationContent()
                content.title = "Måltider"
                content.subtitle = "Dags att äta"
                content.sound = UNNotificationSound.default
                // show this notification five seconds from now
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
                // choose a random identifier
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                // add our notification request
                UNUserNotificationCenter.current().add(request)
                
            }
        }
    }
}

struct NotisSheet_Previews: PreviewProvider {
    static var previews: some View {
        NotisSheet()
    }
}
