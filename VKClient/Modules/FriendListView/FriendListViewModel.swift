//
//  FriendListViewModel.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 08.08.2022.
//

import Foundation
import Combine

final class FriendListViewModel: ObservableObject {
    
    let apiService = FriendApiService()
    
    let input = Input()
    @Published var output = Output()
    
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        setupBindings()
    }
    
    func setupBindings() {
        bindRequest()
    }
    
    func bindRequest() {
        
        input.onAppear
            .map { [unowned self] in
                self.apiService.getFriends()
            }
            .switchToLatest()
            .sink { error in
                print(error)
            } receiveValue: { models in
                for model in models {
                    self.output.friendList.append(FriendModelMapper().toLocal(serverEntity: model))
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
