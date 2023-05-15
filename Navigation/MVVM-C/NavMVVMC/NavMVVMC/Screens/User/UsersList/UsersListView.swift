//
//  UsersListView.swift
//  NavMVVMC
//
//  Created by Luiz Araujo on 14/05/23.
//

import SwiftUI
import Combine

struct UsersListView: View {
    @StateObject var viewModel: UsersListViewModel
    let didClickUser = PassthroughSubject<User, Never>()
    
    var body: some View {
        NavigationView {
            List(viewModel.users) { user in
                Button {
                    didClickUser.send(user)
                } label: {
                    Text(user.name)
                }
            }
            .navigationBarTitle("Users")
            .onAppear {
                viewModel.fetchUsers()
            }
        }
    }
}

struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView(viewModel: UsersListViewModel())
    }
}
