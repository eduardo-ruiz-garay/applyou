//  Applyou
//
//  Created by Eduardo Ruiz-Garay on 7/22/25.
//

import SwiftUI
import FirebaseCore

@main
struct ApplyouApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
