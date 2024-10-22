//
//  NavigationBarModifier.swift
//  ScanIBAN
//
//  Created by walid on 22/10/2024.
//

import SwiftUI
import UIKit


struct NavigationBarModifier: ViewModifier {
    
    init(){
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(AppColors.whiteColor)]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(AppColors.whiteColor)]
        navBarAppearance.backgroundColor = UIColor(AppColors.backgroundColor)
        navBarAppearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
      
    }
    func body(content: Content) -> some View {
        content
        .navigationBarTitleDisplayMode(.inline)
       
    }
}

#Preview {
    NavigationView {
            Text("My Text Text")
            .navigationTitle("Test title")
            .navigationBarModifier()
            
            
    }
}


extension View {
    func navigationBarModifier() -> some View {
        self.modifier(NavigationBarModifier())
    }
}
