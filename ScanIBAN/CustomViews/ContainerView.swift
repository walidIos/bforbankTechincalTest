//
//  ContainerView.swift
//  ScanIBAN
//
//  Created by walid on 22/10/2024.
//

import SwiftUI

struct ContainerView<Content: View>: View {
    var content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
       
        self.content = content
    }
    
    var body: some View {
        ZStack {
            AppColors.backgroundColor
                .ignoresSafeArea() 
            content()
        }
    }
}

#Preview {
    ContainerView {
        VStack {
        
        }
    }
}
