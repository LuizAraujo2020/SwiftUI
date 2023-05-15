//
//  UsersFlowCoordinator.swift
//  NavMVVMC
//
//  Created by Luiz Araujo on 14/05/23.
//

import SwiftUI
import Combine

/// Enum to identify Users Flow screen Types
enum UserPage: String, Identifiable {
    case users, profile

    var id: String {
        self.rawValue
    }
}

final class UserFlowCoordinator: ObservableObject {
    @Published var page: UserPage

    private var id: UUID
    private var userID: Int
    private var cancellables = Set<AnyCancellable>()

    let pushCoordinator = PassthroughSubject<UserFlowCoordinator, Never>()

    init(page: UserPage, userID: Int = 0) {
        id = UUID()
        self.page = page
        self.userID = userID
    }
    
    @ViewBuilder
    func build() -> some View {
        switch self.page {
        case .users:
            usersListView()
        case .profile:
            usersDetailsView()
        }
    }
    
    // MARK: - View Creation Methods
    // View creation methods are responsible for instantiate and return relevant views in the flow. Here you can see we have used this FlowCoordinator class to pass dependencies to our view as well.
    private func usersListView() -> some View {
        let viewModel = UsersListViewModel()
        let usersListView = UsersListView(viewModel: viewModel)
        bind(view: usersListView)
        return usersListView
    }
    
    private func usersDetailsView() -> some View {
        let viewModel = UserDetailsViewModel(userID: userID)
        let userDetailsView = UserDetailsView(viewModel: viewModel)
        return userDetailsView
    }
    
    // MARK: - View Bindings
    private func bind(view: UsersListView) {
        view.didClickUser
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] user in
                self?.showUserProfile(for: user)
            })
            .store(in: &cancellables)
    }
}

// MARK: - Navigation Related Extensions
extension UserFlowCoordinator {
    private func showUserProfile(for user: User) {
        pushCoordinator.send(UserFlowCoordinator(page: .profile, userID: user.id))
    }
}

// MARK: - Required methods for lass to conform to
extension UserFlowCoordinator: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: UserFlowCoordinator, rhs: UserFlowCoordinator) -> Bool {
        return lhs.id == rhs.id
    }
}
