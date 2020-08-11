//
//  Network.swift
//  Timeline
//
//  Created by Thongpak Pongsilathong on 15/7/2563 BE.
//  Copyright © 2563 Thongpak Pongsilathong. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RxAlamofire

final class Network<T: Decodable> {

    private let scheduler: ConcurrentDispatchQueueScheduler

    init() {
        self.scheduler = ConcurrentDispatchQueueScheduler(qos: DispatchQoS(qosClass: DispatchQoS.QoSClass.background, relativePriority: 1))
    }

    func request(router: Router) -> Observable<T> {
        return RxAlamofire
            .requestData(router)
            .debug()
            .observeOn(scheduler)
            .map({ (response, data) -> T in
                return try JSONDecoder().decode(T.self, from: data)
            })
    }

}
