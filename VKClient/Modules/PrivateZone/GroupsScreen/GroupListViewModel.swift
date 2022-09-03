//
//  GroupListViewModel.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 15.08.2022.
//

import Foundation
import Combine
import CombineExt

final class GroupListViewModel: ObservableObject {
    
    // MARK: - DEPENDECIES
    let api: GroupsListApiProtocol
    private weak var router: GroupsRouter?
    
    // MARK: - LOCAL DATA
    let input: Input
    @Published var output: Output
    
    private var cancellable = Set<AnyCancellable>()
    
    // MARK: - INIT
    init(router: GroupsRouter?, api: GroupsListApiProtocol) {
        self.api = api
        self.router = router
        self.input = Input()
        self.output = Output()
        
        setupBindings()
    }
    
    func setupBindings() {
        bindRequest()
        bindModel()
    }
    
    func bindRequest() {
        
        let request = input.onAppear
            .map{ [unowned self] in
                self.api.getGroups()
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
                self?.output.groupList = $0
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
    
    func bindModel() {
        input.model
            .sink { [weak self] in
                self?.router?.goToInfo(model: $0)
            }
            .store(in: &cancellable)
    }
}

extension GroupListViewModel {
    struct Input {
        let onAppear = PassthroughSubject<Void, Never>()
        let model = PassthroughSubject<GroupModel, Never>()
    }
    
    struct Output {
        var groupList: [GroupModel] = []
        var model: GroupModel = GroupModel(id: 0, verified: false, desc: "", subsCount: 0, activity: "", status: "", name: "", screenName: "", isClosed: false, type: "", photoMin: "", photoAvg: "", photoMax: "")
    }
}
