//
//  AlertMessageView.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 09/02/23.
//

import SwiftUI

struct AlertMessageView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var alertMessageViewModel = AlertMessageViewModel()
    @State private var showMessage = false
    
    var body: some View {
        ZStack {
            VStack {
                if alertMessageViewModel.listPosts.isEmpty {
                    EmptyViewPlaceholder(type: .posts)
                        .opacity(Constants.Misc.opacityEmptyView)
                    
                } else {
                    
                    List(alertMessageViewModel.listPosts, id: \.self) { user in
                        Text(user.title)
                    }
                }
                
                // MARK: Buttons
                /// Usually the fetch would be on the `onAppear` or `.task`...
                /// Made this way to chose wether would throw an error or not.
                FetchOptionsView(actionWithoutError: {
                    Task {
                        loadUsers(withError: false)
                    }
                    
                }, actionWithError: {
                    
                    loadUsers(withError: true)
                })
            }
            .padding(.bottom)
             
            if appState.isBusy {
                LoadingView()
            }
        }
        .onChange(of: alertMessageViewModel.userError, perform: { newValue in
            if newValue != nil {
                appState.message = .init(error: alertMessageViewModel.userError!)
            }
        })
        .onChange(of: showMessage, perform: { newValue in
            if !newValue {
                alertMessageViewModel.userError = nil
            }
        })
        .alert(alertMessageViewModel.userError?.customMessage ?? "",isPresented: $showMessage) {
            Button("Try again") {
                self.loadUsers(withError: .random())
            }
            Button("Cancel", role: .cancel) { }
        }
        .animation(.easeInOut, value: appState.isBusy)
        .animation(.easeInOut, value: alertMessageViewModel.listPosts)
        .onChange(of: appState.message) { newValue in
            showMessage = newValue != nil
        }
        .onChange(of: showMessage) { newValue in
            if !newValue {
                appState.message = nil
            }
        }
    }
    
    private func loadUsers(withError: Bool) {
        
        Task {
            appState.isBusy = true
            
            try? await Task.sleep(for: .seconds(Constants.Animations.randomDuration))
            await alertMessageViewModel.loadComments(withError: withError)
            
            appState.isBusy = false
            
            if withError {
                appState.message = FeedbackMessage(error: APIError.allCases.randomElement()!)
                
            } else {
                appState.message = nil
            }
        }
    }
}

struct AlertMessageView_Previews: PreviewProvider {
    static var previews: some View {
        AlertMessageView()
    }
}
