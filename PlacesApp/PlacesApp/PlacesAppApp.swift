//
//  PlacesAppApp.swift
//  PlacesApp
//
//  Created by Darkhan Kuanyshbay on 18.02.2021.
//

import SwiftUI

@main
struct PlacesAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(mapType: "Normal", currentPlace: .init(name: "Suleyman Demirel University", location: .init(latitude: 16.123123, longitude: 67.676767)))
        }
    }
}
