//
//  APi.swift
//  HelloMySPO
//
//  Created by Lazy on 2019/4/25.
//  Copyright © 2019 Lazy. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import Moya_ObjectMapper

class APi {

    private let provider = MoyaProvider<Service>()
    private let queue = SerialDispatchQueueScheduler.init(qos: .background)

    func fetch(id: String, token: String) -> Observable<TrackModel> {
        return provider.rx.request(.fetch(id: id, token: token)).asObservable().mapObject(TrackModel.self).subscribeOn(queue).observeOn(MainScheduler.instance)
    }
}
