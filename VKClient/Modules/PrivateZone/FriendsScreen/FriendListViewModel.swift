//
//  FriendListViewModel.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 08.08.2022.
//

import Foundation
import Combine
import CombineExt

final class FriendListViewModel: ObservableObject {
    
    // MARK: - DEPERNDECIES
    let apiService = FriendApiService()
    
    // MARK: - LOCAL DATA
    let input: Input
    @Published var output: Output
    
    let router: FriendsRouter?
    private var cancellable = Set<AnyCancellable>()
    
    // MARK: - INIT
    init(router: FriendsRouter?) {
        self.router = router
        self.input = Input()
        self.output = Output()
        
        
        setupBindings()
    }
    
    func setupBindings() {
        bindRequest()
        bindFriendTap()
    }
    
    func bindRequest() {
        
        let request = input.onAppear
            .map{ [unowned self] in
                self.apiService.getFriends(id: nil)
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
                self?.output.friendList = $0
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
    
    func bindFriendTap() {
        input.onFriendTap
            .sink { [weak self] in
                self?.router?.goToInfo(id: $0)
            }
            .store(in: &cancellable)
    }
}


extension FriendListViewModel {
    struct Input {
        let onAppear = PassthroughSubject<Void, Never>()
        let onFriendTap = PassthroughSubject<Int, Never>()
    }
    
    struct Output {
        var friendList: [FriendModel] = []
    }
}
