//
//  BottomSheetViewForConfirmation.swift
//  ScanIBAN
//
//  Created by walid on 22/10/2024.
//

import SwiftUI

struct BottomSheetView: View {
    let iban: String
    let onValidate: () -> Void
    let onRsume: () -> Void

    var body: some View {
        
                VStack {
                    VStack(spacing: Margins.medium) {
                        Text("L'IBAN du bénificaire a été scanné")
                            .font(.title)
                            .foregroundStyle(AppColors.whiteColor)
                        Text("Pensez à le verifier avant de valider :")
                            .font(.headline)
                            .foregroundStyle(AppColors.whiteColor)
                        Text(iban)
                            .font(.headline)
                            .foregroundStyle(AppColors.whiteColor)
                        Button(action: onValidate) {
                            Text("Valider")
                                .frame(maxWidth: .infinity)
                        }
                         .buttonStyle(.primary)
                        
                        Button(action: onRsume) {
                            Text("Recommencer")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.secondary)
                    }
                    .padding()
                    .background(AppColors.backgroundColor)
                    .cornerRadius(CornerRadius.veryLarge, corners: [.topLeft, .topRight])
                    .transition(.move(edge: .bottom))
                    .edgesIgnoringSafeArea(.bottom)
                }
            }
        
    
}





#Preview {
    BottomSheetView(iban: "FR76 3001 3000 3000 1234 5678 624", onValidate: {}, onRsume: {})
}
