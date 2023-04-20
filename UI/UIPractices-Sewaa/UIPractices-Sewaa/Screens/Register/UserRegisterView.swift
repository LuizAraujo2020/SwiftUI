//
//  UserRegisterView.swift
//  UIPractices-Sewaa
//
//  Created by Luiz Araujo on 09/01/23.
//

import SwiftUI

struct UserRegisterView: View {
    init() {
        
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(named: "accent") ?? .black]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(named: "accent") ?? .black]
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                MainTextfieldView(input: .constant(""), isBig: false,
                                  title: "FIRST NAME :", placeholder: "David")
                .frame(width: .btnWidthSmall, height: .btnHeight)
                .padding(.top, .spacing2)
                .padding(.bottom, .spacing2 * 0.5)
                
                Spacer()
                
                MainTextfieldView(input: .constant(""), isBig: false,
                                  title: "LAST NAME :", placeholder: "Shearer")
                .frame(width: .btnWidthSmall, height: .btnHeight)
                .padding(.top, .spacing2)
                .padding(.bottom, .spacing2 * 0.5)
                
                Spacer()
            }
            
            VStack {
                MainTextfieldView(input: .constant(""), isBig: true,
                                  title: "COUNTRY :", placeholder: "")
                .frame(width: .btnWidthBig)
                .padding(.top, .spacing)
                
                MainTextfieldView(input: .constant(""), isBig: true,
                                  title: "EMAIL :", placeholder: "david@sewaa.com")
                .frame(width: .btnWidthBig)
                .padding(.top, .spacing)
                
                MainTextfieldView(input: .constant(""), isBig: true,
                                  title: "MOBILE :", placeholder: "644-631-9422")
                .frame(width: .btnWidthBig)
                .padding(.top, .spacing)
                
                MainTextfieldView(input: .constant(""), isBig: true,
                                  title: "PASSWORD :", placeholder: "")
                .frame(width: .btnWidthBig)
                .padding(.top, .spacing)
                
                MainButtonView(isBig: true, isRed: true, title: "Register", action: { })
                    .frame(width: .btnWidthBig)
                    .padding(.top, .spacing2)
            }
            
            HStack {
                Text("By Sign up, you agree our")
                    .foregroundColor(.flagBackgroundSecondary)
                
                Text("Terms and Conditions")
                    .foregroundColor(.accentColor)
            }
            .font(.subheadline)
            .padding(.vertical, .spacing1)
            
            Divider()
            
            HStack {
                Text("Already have an account?")
                    .foregroundColor(.flagBackgroundSecondary)
                
                Text("Login")
                    .foregroundColor(.accentColor)
            }
            .font(.subheadline)
            .padding(.vertical, .spacing1)
        }
        .navigationTitle("Register")
    }
}

struct UserRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            UserRegisterView()
        }
    }
}
