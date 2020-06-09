//
//  PostData.swift
//  Space News
//
//  Created by Jade Kim on 5/12/20.
//  Copyright © 2020 Jade Kim. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let docs: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return _id
    }

    let _id: String
    let title: String
    let featured_image: String
    let published_date: String
    let url: String?
}
