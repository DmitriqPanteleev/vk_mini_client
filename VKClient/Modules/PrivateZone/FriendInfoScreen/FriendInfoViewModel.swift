//
//  FriendInfoViewModel.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 24.08.2022.
//

import Foundation
import Combine
import CombineExt

final class FriendInfoViewModel: ObservableObject {
    
    // MARK: - DEPENDECIES
    let api = UserApiService()
    
    let input: Input
    @Published var output: Output
    
    private let friendId: Int
    private var cancellable = Set<AnyCancellable>()
    
    // MARK: - INIT
    init(friendId: Int) {
        self.friendId = friendId
        self.input = Input()
        self.output = Output()
        
        setupBindings()
    }
    
    func setupBindings() {
        bindRequest()
    }
    
    func bindRequest() {
        let request = input.onAppear
            .map{ [unowned self] in
                self.api.getUser(id: self.friendId)
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
                self?.output.friend = $0
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
}

extension FriendInfoViewModel {
    struct Input {
        let onAppear = PassthroughSubject<Void, Never>()
    }

    struct Output {
        var friend: UserModel?
    }
//    UserModel(id: 0, domain: "", city: "", photoMaxOrig: "", status: "", lastSeen: "", followersCount: 10, commonCount: 10, counters: [:], online: false, firstName: "Oleg", lastName: "", canAccessClosed: false, isClosed: false)
}
