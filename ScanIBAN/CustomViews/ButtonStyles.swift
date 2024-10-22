//
//  ButtonStyles.swift
//  ScanIBAN
//
//  Created by walid on 22/10/2024.
//

import SwiftUI



 struct PrimaryButtonStyle: ButtonStyle {
     func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(AppColors.whiteColor)
            .background(
                RoundedRectangle(
                    cornerRadius: CornerRadius.extraLarge,
                    style: .continuous
                )
                .fill(AppColors.tealColor)

            )
    }
}

 extension ButtonStyle where Self == PrimaryButtonStyle {
    static var primary: PrimaryButtonStyle { .init() }

}

 struct SecondaryButtonStyle: ButtonStyle {
     func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(AppColors.tealColor)
            .background(
                RoundedRectangle(
                    cornerRadius: CornerRadius.extraLarge,
                    style: .continuous
                )
                .stroke((AppColors.tealColor), lineWidth: 2)

            )
    }
}

 extension ButtonStyle where Self == SecondaryButtonStyle {
    static var secondary: SecondaryButtonStyle { .init() }
}

#Preview {
    Group {
        Button(action: {

        }, label: {
            HStack {
                Text("Button")
            }
        })
        .buttonStyle(.primary)

        Button(action: {

        }, label: {
            HStack {
                Text("Button")
            }
        })
        .buttonStyle(.secondary)
    }

}
