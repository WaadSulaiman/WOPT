//
//  WOPTApp.swift
//  WOPT
//
//  Created by Waad on 2021-02-04.
//

import SwiftUI
import Firebase


@main
struct WOPTApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            RegisterView().environmentObject(SessionStore())
            
        }
    }
}
