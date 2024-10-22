//
//  ScanIBANView.swift
//  ScanIBAN
//
//  Created by walid on 22/10/2024.
//
import SwiftUI
import VisionKit

struct ScanIBANView: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var textIBAN: String
    @State var startScan = false
    @State var foundIBAN: String?
    
    var body: some View {
        NavigationStack {
            ContainerView {
                ZStack(alignment: .bottom) {
                    if DataScannerViewController.isSupported {
                        IBANScannerViewController(startScan: $startScan, foundIBAN: $foundIBAN)
                    }
                    
                    VStack {
                        Text("Placer votre IBAN dans le cadre pour le scanner")
                            .bold()
                            .foregroundStyle(AppColors.whiteColor)
                            .padding(.top, Margins.large)
                        Spacer()
                    }
                   
                    if let iban = foundIBAN {
                        BottomSheetView(
                            iban: iban,
                            onValidate: {
                                textIBAN = iban
                                foundIBAN = nil
                                    dismiss()
                            },
                            onRsume: {
                                startScan = true
                                foundIBAN = nil
                            }
                            )
                        .zIndex(2)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                    }
                    
                }
                .ignoresSafeArea(edges: .bottom)
            }
            .navigationBarModifier()
            .onAppear {
                startScan = true
            }
          
            .addBackButton {
                    dismiss()
                }
            .onChange(of: foundIBAN, { _, newValue in
                startScan = newValue == nil
            })
            
            .animation(.bouncy, value: foundIBAN)
            .navigationTitle("Scanner votre IBAN")
        }
    }
}


#Preview {
    ScanIBANView(textIBAN: .init(get: { "" }, set: { _ in }))
}
