//
//  SwiftUITestApp.swift
//  SwiftUITest
//
//  Created by yawmoo_ext on 09/11/22.
//

import SwiftUI

class Item : ObservableObject {
    @Published var name: String = "1"
    @Published var price: Double = 20
}

@main
struct SwiftUITestApp: App {
    @StateObject var item = Item()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(item)
        }
    }
}
