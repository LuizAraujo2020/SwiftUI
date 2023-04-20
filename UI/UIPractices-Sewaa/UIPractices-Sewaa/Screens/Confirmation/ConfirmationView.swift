//
//  ConfirmationView.swift
//  UIPractices-Sewaa
//
//  Created by Luiz Araujo on 10/01/23.
//

import SwiftUI

struct ConfirmationView: View {
    init() {
        
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(named: "accent") ?? .black]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(named: "accent") ?? .black]
    }
    
    var body: some View {
        VStack {
            
            Text("Code message has been sent to your number, ans submit OTP code below to verify your account.")
                .foregroundColor(.textSecondary)
                .font(.headline)
                .padding(.spacing1)
            
            VStack {
                
                MainTextfieldView(input: .constant(""), isBig: true,
                                  title: "OTP CODE :", placeholder: "1746-3429-2134")
                .frame(width: .btnWidthBig)
                .padding(.top, .spacing)
                
                MainButtonView(isBig: true, isRed: true, title: "Submit", action: { })
                    .frame(width: .btnWidthBig)
                    .padding(.top, .spacing2)
            }
            
            
            Spacer()
            
            Divider()
            
            HStack {
                Text("Didn't received any message?")
                    .foregroundColor(.flagBackgroundSecondary)
                
                Text("Resend Code")
                    .foregroundColor(.accentColor)
            }
            .font(.subheadline)
            .padding(.vertical, .spacing1)
        }
        .navigationTitle("Confirmation")
        .padding(.top, .spacing2)
    }
}

struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ConfirmationView()
        }
    }
}
