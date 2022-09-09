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
    let api: UserApiProtocol
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
         api: UserApiProtocol) {
        self.router = router
        self.userId = userId
        self.api = api
        self.input = Input()
        self.output = Output()
        
        setupBindings()
    }
    
    func setupBindings() {
        bindUserRequest()
        bindFriendsRequest(id: self.userId)
        bindAlbumsRequest(id: self.userId)
        bindInfoButton()
        bindCellButton()
    }
    
    func bindUserRequest() {
        
        let request = input.onAppear
            .map{ [unowned self] in
                self.api.getUser(id: self.userId)
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
    
    func bindFriendsRequest(id: Int) {
        let request = input.onAppear
            .map { [unowned self] in
                self.api.getFriends(id: id)
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
    
    func bindAlbumsRequest(id: Int) {
        let request = input.onAppear
            .map { [unowned self] in
                self.api.getAlbums(ownerId: "\(id)")
                    .materialize()
            }
            .switchToLatest()
            .share()
        
        request
            .values()
            .sink { [weak self] in
                self?.output.albumsList = $0
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
    
    func bindCellButton() {
        self.input.onFriendCellTap
            .sink {
                self.bindFriendsRequest(id: $0)
                self.router?.goToUsersFriend(id: $0)
            }
            .store(in: &cancellable)
    }
}

extension UserInfoViewModel {
    struct Input {
        let onAppear = PassthroughSubject<Void, Never>()
        let onInfoButtonTap = PassthroughSubject<Void, Never>()
        let onFriendCellTap = PassthroughSubject<Int, Never>()
    }

    struct Output {
        var user: UserModel?
        var userFriends: [FriendModel] = []
        var albumsList: [AlbumModel] = []
    }
}
