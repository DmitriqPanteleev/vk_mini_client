//
//  AuthWebViewModel.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 09.08.2022.
//

import Foundation
import Combine

final class AuthWebViewModel: ObservableObject {
    let input = Input()
    @Published var output = Output()
    
    let url = URLInit.current.authUrl
    var token = LocalStorage.current.token
    var cancellable = Set<AnyCancellable>()
    
    init() {
        setupBindings()
    }
    
    func setupBindings() {
        bind()
    }
    
    func bind() {
        input.onComplitedWebView
            .sink { [weak self] in
                self?.output.showFriends = true
            }
            .store(in: &cancellable)
    }
}

extension AuthWebViewModel {
    
    struct Input {
        let onComplitedWebView = PassthroughSubject<Void, Never>()
    }
    
    struct Output {
        var showFriends = LocalStorage.current.token != nil
    }
}
