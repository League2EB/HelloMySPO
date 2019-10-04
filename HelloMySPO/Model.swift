//
//  Model.swift
//  HelloMySPO
//
//  Created by Lazy on 2019/4/25.
//  Copyright © 2019 Lazy. All rights reserved.
//

import Foundation
import ObjectMapper

class TrackModel: Mappable {

    var tracks: [ContentObject] = []

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        tracks <- map["tracks"]
    }
}

class ContentObject: Mappable {

    var name: String = ""
    var mp3URL: String = ""

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        name <- map["name"]
        mp3URL <- map["preview_url"]
    }
}
