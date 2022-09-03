//
//  FriendInfoViewModel.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 24.08.2022.
//

import Foundation
import Combine
import CombineExt

final class UserInfoViewModel: ObservableObject {
    
    // MARK: - DEPENDECIES
    let friendApi: FriendsListApiProtocol
    let userApi: UserApiProtocol
    let router: UserRouter?
    
    // MARK: - LOCAL DATA
    let input: Input
    @Published var output: Output
    
    // MARK: LOCAL VARIABLES
    private let userId: Int
    private var cancellable = Set<AnyCancellable>()
    
    // MARK: - INIT
    init(router: UserRouter?,
         userId: Int,
         userApi: UserApiProtocol,
         friendApi: FriendsListApiProtocol) {
        self.router = router
        self.userId = userId
        self.userApi = userApi
        self.friendApi = friendApi
        self.input = Input()
        self.output = Output()
        
        setupBindings()
    }
    
    func setupBindings() {
        bindUserRequest()
        bindFriendsRequest()
        bindInfoButton()
    }
    
    func bindUserRequest() {
        
        let request = input.onAppear
            .map{ [unowned self] in
                self.userApi.getUser(id: self.userId)
                    // CombineExt's method to wrap event
                    // so event can be alive even after errors for example
                    .materialize()
            }
            .switchToLatest()
            // method for many subscribers
            .share()
        
        request
            .values()
            .sink { [weak self] in
                self?.output.user = $0
            }
            .store(in: &cancellable)
        
        request
            .failures()
            .sink {
                switch $0 {
                case .bad: print("bad")
                case .notFound: print("notFound")
                }
            }
            .store(in: &cancellable)
    }
    
    func bindFriendsRequest() {
        let request = input.onAppear
            .map { [unowned self] in
                self.friendApi.getFriends(id: self.userId)
                    .materialize()
            }
            .switchToLatest()
            .share()
        
        request
            .values()
            .sink { [weak self] in
                self?.output.userFriends = $0
            }
            .store(in: &cancellable)
        
        request
            .failures()
            .sink {
                switch $0 {
                case .bad: print("bad")
                case .notFound: print("notFound")
                }
            }
            .store(in: &cancellable)
        
    }
    
    func bindInfoButton() {
        self.input.onInfoButtonTap
            .sink {
                self.router?.goToDetails(model: self.output.user!)
            }
            .store(in: &cancellable)
    }
}

extension UserInfoViewModel {
    struct Input {
        let onAppear = PassthroughSubject<Void, Never>()
        let onInfoButtonTap = PassthroughSubject<Void, Never>()
    }

    struct Output {
        var user: UserModel?
        var userFriends: [FriendModel] = []
    }
}
