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
    
    let apiService = FriendApiService()
    
    let input: Input
    @Published var output: Output
    
    private var cancellable = Set<AnyCancellable>()
    
    init() {
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
                self.apiService.getFriends()
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
    
    
}

extension FriendListViewModel {
    struct Input {
        let onAppear = PassthroughSubject<Void, Never>()
    }
    
    struct Output {
        var friendList: [FriendModel] = []
    }
}
