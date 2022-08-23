//
//  AlbumListViewModel.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 19.08.2022.
//

import Foundation
import Combine

final class AlbumListViewModel: ObservableObject {
    
    let api = PhotoApiService()
    
    let input: Input
    @Published var output: Output
    
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        self.input = Input()
        self.output = Output()
        bind()
    }
    
    func bind() {
        bundRequest()
        bindCellTap()
    }
    
    func bundRequest() {
        let request = input.onAppear
            .map{ [unowned self] in
                self.api.getAlbums()
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
                self?.output.albumList = $0
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
    
    func bindCellTap() {
        // TODO: bind
    }
    
    struct Input {
        let onAppear = PassthroughSubject<Void, Never>()
        let onCellTap = PassthroughSubject<Int, Never>()
    }
    
    struct Output {
        var albumList: [AlbumModel] = []
    }
}