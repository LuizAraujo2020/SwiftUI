//
//  LoginView.swift
//  UIPractices-Sewaa
//
//  Created by Luiz Araujo on 10/01/23.
//

import SwiftUI

struct LoginView: View {
    init() {
        
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(named: "accent") ?? .black]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(named: "accent") ?? .black]
    }
    
    var body: some View {
        VStack {
            
            VStack {
                MainTextfieldView(input: .constant(""), isBig: true,
                                  title: "YOUR EMAIL :", placeholder: "david@sewaa.com")
                .frame(width: .btnWidthBig)
                .padding(.top, .spacing)
                
                MainTextfieldView(input: .constant(""), isBig: true,
                                  title: "PASSWORD :", placeholder: "************")
                .frame(width: .btnWidthBig)
                .padding(.top, .spacing)
                
                MainButtonView(isBig: true, isRed: true, title: "Login", action: { })
                    .frame(width: .btnWidthBig)
                    .padding(.top, .spacing2)
            }
            
            HStack {
                Text("Can't login?")
                    .foregroundColor(.flagBackgroundSecondary)
                
                Text("Forgot Password.")
                    .foregroundColor(.accentColor)
            }
            .font(.subheadline)
            .padding(.vertical, .spacing1)
            
            Spacer()
            
            Divider()
            
            HStack {
                Text("Don't have an account?")
                    .foregroundColor(.flagBackgroundSecondary)
                
                Text("Register")
                    .foregroundColor(.accentColor)
            }
            .font(.subheadline)
            .padding(.vertical, .spacing1)
        }
        .navigationTitle("Login")
        .padding(.top, .spacing2)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LoginView()
        }
    }
}
