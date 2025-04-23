//
//  ItemoApp.swift
//  Itemo
//
//  Created by Jaime Lucea on 17/4/25.
//

import SwiftUI

@main
struct ItemoApp: App {
    
    @StateObject private var categoriesVM = CategoriesViewModel()
    
    var body: some Scene {
        WindowGroup {
            ListingsView()
                .environmentObject(categoriesVM)
        }
    }
}
