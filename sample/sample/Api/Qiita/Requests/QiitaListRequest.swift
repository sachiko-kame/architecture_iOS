//
//  QiitaListRequest.swift
//  sample
//
//  Created by 水野祥子 on 2020/04/16.
//  Copyright © 2020 sachiko. All rights reserved.
//

import APIKit

struct QiitaListRequest: QiitaBaseRequest {
    typealias Response = QiitaItem
    
    var method: HTTPMethod { .get }
    var path: String { "/api/v2/items" }
    var parameters: [String: Any] { ["page": "1", "per_page": "20"] }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        return try Response(object: object)
    }
}

struct QiitaItem {
    let qiitaItems: [[String: Any]]
    
    init(object: Any) throws {
        guard let dictionary = object as? [[String: Any]] else {
            throw ResponseError.unexpectedObject(object)
        }
        
        self.qiitaItems = dictionary
    }
}

// TODO: APIKitを使ったことがないのですぐにできなかったが、 `Decodable` プロトコルに準拠させたい
struct Qiita {
    let title: String
    let updated_at: String
    let url: String
    let comments_count: Int
    let likes_count: Int
    let tags: [[String: Any]]
    let user: [String: Any]
    let username: String
    let profile_image_url: String
    let id: String
    var isRead = false
    
    init(Item: [String:Any]) {
        self.title = Item["title"] as! String
        self.updated_at = Item["updated_at"] as! String
        self.url = Item["url"] as! String
        self.comments_count = Item["comments_count"] as! Int
        self.likes_count = Item["likes_count"] as! Int
        self.tags = Item["tags"] as! [[String:Any]]
        self.user = Item["user"] as! [String: Any]
        self.username = self.user["name"] as! String
        self.profile_image_url = self.user["profile_image_url"] as! String
        self.id = Item["id"] as! String
    }
}
