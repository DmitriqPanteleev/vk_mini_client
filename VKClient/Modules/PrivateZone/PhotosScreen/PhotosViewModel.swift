//
//  AlbumPhotosViewModel.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 21.08.2022.
//

import Foundation
import Combine

final class PhotosViewModel: ObservableObject {
    // MARK: - DEPENDECIES
    let api: PhotosApiProtocol
    let router: AlbumRouter?
    
    // MARK: - LOCAL DATA
    let input: Input
    @Published var output: Output
    
    private var cancellable = Set<AnyCancellable>()
    
    // MARK: - INIT
    init(router: AlbumRouter?, api: PhotosApiProtocol) {
        self.api = api
        self.router = router
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
                self.api.getPhotos(ownerId: String(LocalStorage.current.vkID!),
                                   albumId: $0)
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
                self?.output.photos = $0
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

extension PhotosViewModel {
    
    struct Input {
        let onAppear = PassthroughSubject<String, Never>()
    }
    
    struct Output {
        var photos: [PhotoModel] = []
    }
}
