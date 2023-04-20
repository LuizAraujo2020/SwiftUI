//
//  FeedbackMessageView.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 09/02/23.
//

import SwiftUI

struct FeedbackMessageView: View {
    @State var degrees = Constants.Animations.startDegrees
    @Binding var showMessage: Bool
    
    let message: FeedbackMessage
    
    @State private var isRotating = true
    
    private let sizeStandard = CGFloat(100)
    
    var body: some View {
        ZStack {
            createBackground()
                .padding(.bottom, sizeStandard * 0.5)
            
            VStack {
                createBadge()
                    .padding(.bottom, sizeStandard * 0.5)
                
                createText()
            }
        }
        .rotation3DEffect(.degrees(degrees), axis: (x: 0, y:  1, z:  0))
        .animation(.easeInOut(duration: Constants.Animations.duration), value: degrees)
        .shadow(radius: 20)
        .scaleEffect(CGSize(width: 0.5, height: 0.5))
        .onTapGesture {

            if isRotating {
                isRotating = false
                
            } else {
                showMessage = false
            }
        }
        .task {
            try? await Task.sleep(for: .seconds(Constants.Animations.duration))
            isRotating = false
        }
        .onAppear {
            degrees = Constants.Animations.endDegrees
        }
        .onDisappear {
            degrees = Constants.Animations.startDegrees
        }
    }
    
    @ViewBuilder
    private func createText() -> some View {
        ScrollView {
            Text("\(message.message)".uppercased())
                .multilineTextAlignment(.center)
                .font(.system(.title, design: .rounded))
                .padding(.top, sizeStandard * 0.5)
                .padding([.horizontal, .bottom], sizeStandard * 0.2)
                .lineLimit(1...5)
                .shadow(radius: 1)
                .foregroundColor(.white)
        }
        .frame(height: sizeStandard * 2)
    }
    
    @ViewBuilder
    private func createBackgroundBadge() -> some View {
        
        switch message.type {
        case .successful:
            RoundedRectangle(cornerRadius: sizeStandard * 0.5)
                .foregroundColor(.successPure)
            
        case .error:
            RoundedRectangle(cornerRadius: sizeStandard * 0.5)
                .foregroundColor(.errorPure)
            
        case .info:
            RoundedRectangle(cornerRadius: sizeStandard * 0.5)
                .foregroundColor(.textLightGray)
        }
    }
    
    @ViewBuilder
    private func createBadge() -> some View {
        ZStack {
            
            createBackgroundBadge()
                .frame(width: sizeStandard * 3, height: sizeStandard * 3)
                .rotationEffect(.degrees(message.type != .info ? 45 : 0))
            
            VStack {
                Image(systemName: message.type.symbol)
                    .font(.system(size: sizeStandard * 1.3))
                    .shadow(radius: 5)
                
                Text(message.type.title)
                    .font(.system(size: sizeStandard * 0.35))
                    .fontWeight(.bold)
                    .font(.system(.largeTitle, design: .rounded))
                    .padding(.vertical)
            }
        }
    }
    
    @ViewBuilder
    private func createBackground() -> some View {
        RoundedRectangle(cornerRadius: sizeStandard * 0.5)
            .frame(width: sizeStandard * 5, height: sizeStandard * 7)
            .foregroundStyle(Color.darkModeDark)
        //            .opacity(0.5)
        //            .blur(radius: 0.1)
    }
}


struct ErrorMessageView: View {
    
    @State private var rotateX = true
    @EnvironmentObject var appState: AppState
    @State var showMessage: Bool
    
    var body: some View {
        if(appState.isBusy){
            LoadingView()
            
        }else{
            ZStack {
                VStack {
                    Text("Olá, Luiz")
                        .navigationTitle("Home")
                        .toolbar {
                            
                            Button {
                                Task{
                                    // await appState.signOut()
                                }
                            } label: {
                                Image(systemName:  "rectangle.portrait.and.arrow.right")
                                    .font(.largeTitle)
                            }
                        }
                    
                    Spacer()
                    
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Hello, world!")
                }
                .padding()
                .onTapGesture {
                    rotateMessage()
                }
                
                if let msg = appState.message, showMessage {
                    FeedbackMessageView(showMessage: $showMessage, message: msg)
                }
            }
            .onChange(of: appState.message) { newValue in
                showMessage = newValue != nil
            }
        }
    }
    
    fileprivate func rotateMessage() {
        showMessage.toggle()
        
        if showMessage {
            appState.message = .init(type: .allCases.randomElement()!,
                                     message: "Opa! Deu alguma coisa!")
        }
    }
}

struct ErrorMessage_Previews: PreviewProvider {
    static var previews: some View {
        ErrorMessageView(showMessage: true)
            .environmentObject(AppState())
    }
}




