//
//  ContentSectionAppearanceView.swift
//  ISDesafioMod10
//
//  Created by Luiz Araujo on 05/03/23.
//

import SwiftUI

struct ContentSectionAppearanceView: View {
    @ObservedObject var viewModel: ContentView.ViewModel
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        Section(header:
                    Text("APARÊNCIA")
            .font(.system(size: 17 * viewModel.textSize, weight: viewModel.isBold ? .bold : .regular))
        ) {
            VStack {
                HStack() {
                    Spacer ()
                    
                    VStack {
                        Image(Constants.Images.iphoneLightMode)
                            .resizable()
                            .scaledToFit()
                            .frame(width: Constants.Sizes.screenWidth * 0.15384615384615385)
                        
                        Text("Clara")
                            .font(.system(size: 17 * viewModel.textSize, weight: viewModel.isBold ? .bold : .regular))
                        
                        Image(systemName: colorScheme == .light ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(colorScheme == .light ? .accentColor : .gray)
                            .imageScale(.large)
                    }
                    .onTapGesture {
                        viewModel.isDarkMode     = false
                        viewModel.appearanceAuto = false
                    }

                    Spacer ()
                    
                    VStack {
                        Image(Constants.Images.iphoneDarkMode)
                            .resizable()
                            .scaledToFit()
                            .frame(width: Constants.Sizes.screenWidth * 0.15384615384615385)
                        
                        Text("Escura")
                            .font(.system(size: 17 * viewModel.textSize, weight: viewModel.isBold ? .bold : .regular))
                        
                        Image(systemName: colorScheme == .dark ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(colorScheme == .dark ? .accentColor : .gray)
                            .imageScale(.large)
                    }
                    .onTapGesture {
                        viewModel.isDarkMode     = true
                        viewModel.appearanceAuto = false
                    }
                    
                    Spacer ()
                }
                
                Divider()
                
                HStack {
                    Text("Automática")
                        .font(.system(size: 17 * viewModel.textSize, weight: viewModel.isBold ? .bold : .regular))
                    Spacer()
                    Toggle("", isOn: $viewModel.appearanceAuto)
                }
            }
        }
        .onChange(of: viewModel.appearanceAuto) { newValue in
            if newValue {
                viewModel.setSchemeAuto()
            }
        }
    }
}

struct ContentSectionAppearanceView_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            ContentSectionAppearanceView(viewModel: ContentView.ViewModel())
        }
    }
}
