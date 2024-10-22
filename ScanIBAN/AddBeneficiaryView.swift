//
//  ContentView.swift
//  ScanIBAN
//
//  Created by walid on 22/10/2024.
//

import SwiftUI

struct AddBeneficiaryView: View {
    @State var IBAN: String = ""
    @State private var isShowingScanView = false
    var body: some View {
        NavigationStack {
            ContainerView {
                HStack {
                    VStack(alignment: .leading, spacing: Margins.medium) {
                        Text("Scannez, importez ou saisissez l’IBAN")
                            .font(AppFonts.body)
                            .foregroundColor(AppColors.whiteColor)
                        HStack {
                            
                            Button(action: {
                                isShowingScanView = true
                            }, label: {
                                HStack {
                                    Image(systemName: "camera")
                                    Text("Scannez")
                                }
                                .frame(maxWidth: .infinity)
                                .contentShape(Rectangle())
                                
                            })
                            .accessibilityIdentifier("scan")
                            .buttonStyle(.secondary)
                        }
                        TextField(
                            "",
                            text: $IBAN,
                            prompt: Text("FR76 XXXX")
                                .foregroundColor(.white.opacity(0.4))
                        )
                        .frame(height: 50)
                        .tint(.white)
                        .foregroundColor(AppColors.whiteColor)
                        .padding([.leading, .trailing], Margins.small)
                        .background(
                            RoundedRectangle(cornerRadius: CornerRadius.small)
                                .stroke(
                                    lineWidth: 1
                                )
                                .fill(AppColors.whiteColor.opacity(0.15))
                        )
                        .overlay {
                            VStack {
                                Spacer()
                                Rectangle()
                                    .fill(AppColors.whiteColor.opacity(0.5))
                                    .frame(height: 2)
                            }
                            .padding([.leading, .trailing], Margins.small)
                            .padding(.bottom, Margins.verySmall)
                        }
                        
                        Spacer()
                        
                    }
                    
                    
                }
                .padding(Margins.medium)
                
                
                
                .navigationTitle("Ajouter un bénéficiaire")
                .navigationBarModifier()
                .navigationDestination(isPresented: $isShowingScanView) {
                    ScanIBANView(textIBAN: $IBAN)
                }
                
            }
        }
    }
}

#Preview {
   
        AddBeneficiaryView()
   
}
