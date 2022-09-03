//
//  UserApiService.swift
//  VKClient
//
//  Created by Дмитрий Пантелеев on 24.08.2022.
//

import Foundation
import Moya
import Combine
import CombineMoya

struct VKApiService {
    let provider = Provider<VKApi>()
}

extension VKApiService {
    
    func getUser(id: Int) -> AnyPublisher<UserModel, APIError> {
        provider.requestPublisher(.getUser(id: id))
            .filterSuccessfulStatusCodes()
            .map(ServerResponse<UserServerModel>.self)
            .map {
                $0.response }
            .map { UserMapper().toLocal(list: $0).first! }
            .mapError({ error in
                print(error)
                   return  .bad
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func getFriends(id: Int?) -> AnyPublisher<[FriendModel], APIError> {
        provider.requestPublisher(.getFriends(ownerId: id))
            .filterSuccessfulStatusCodes()
            .map(ServerListResponse<FriendServerModel>.self)
            .map { $0.response.items }
            .map { FriendModelMapper().toLocal(list: $0) }
            .mapError({ _ in
                    .bad
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func getGroups() -> AnyPublisher<[GroupModel], APIError> {
        provider.requestPublisher(.getGroups)
            .filterSuccessfulStatusCodes()
            .map(ServerListResponse<GroupServerModel>.self)
            .map { $0.response.items }
            .map { GroupModelMapper().toLocal(list: $0) }
            .mapError({ _ in
                    .bad
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func getPhotos(ownerId: String?, albumId: String?) -> AnyPublisher<[PhotoModel], APIError> {
        provider.requestPublisher(.getPhotos(ownerId: ownerId, albumId: albumId))
            .filterSuccessfulStatusCodes()
            .map(ServerListResponse<PhotoServerModel>.self)
            .map { $0.response.items }
            .map { PhotoModelMapper().toLocal(list: $0) }
            .mapError({ _ in
                .bad
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func getAlbums(ownerId: String?) -> AnyPublisher<[AlbumModel], APIError> {
        provider.requestPublisher(.getAlbums(ownerId: ownerId))
            .filterSuccessfulStatusCodes()
            .map(ServerListResponse<AlbumServerModel>.self)
            .map { $0.response.items }
            .map { AlbumModelMapper().toLocal(list: $0) }
            .mapError({ _ in
                    .bad
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}


// подписываем структуру на существующие протоколы
extension VKApiService: UserApiProtocol{}
extension VKApiService: PhotosApiProtocol{}
extension VKApiService: AlbumListApiProtocol{}
extension VKApiService: GroupsListApiProtocol{}
extension VKApiService: FriendsListApiProtocol{}

// протоколы для инкапсуляции необходимых методов по экранам
// чтобы не было возможности работать с другими методами
protocol AlbumListApiProtocol {
    func getAlbums(ownerId: String?) -> AnyPublisher<[AlbumModel], APIError>
    func getPhotos(ownerId: String?, albumId: String?) -> AnyPublisher<[PhotoModel], APIError>
}

protocol PhotosApiProtocol {
    func getPhotos(ownerId: String?, albumId: String?) -> AnyPublisher<[PhotoModel], APIError>
}

protocol FriendsListApiProtocol {
    func getFriends(id: Int?) -> AnyPublisher<[FriendModel], APIError>
}

protocol GroupsListApiProtocol {
    func getGroups() -> AnyPublisher<[GroupModel], APIError>
}

protocol UserApiProtocol {
    func getGroups() -> AnyPublisher<[GroupModel], APIError>
    func getUser(id: Int) -> AnyPublisher<UserModel, APIError>
    func getFriends(id: Int?) -> AnyPublisher<[FriendModel], APIError>
    func getPhotos(ownerId: String?, albumId: String?) -> AnyPublisher<[PhotoModel], APIError>
}
