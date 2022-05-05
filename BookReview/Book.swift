//
//  Book.swift
//  BookReview
//
//  Created by kmjmarine on 2022/05/01.
//

import Foundation

struct Book: Decodable {
    let title: String
    private let image: String?
    
    var imageURL: URL? { URL(string: image ?? "") }
    
    init(title: String, imageURL: String?) {
        self.title = title
        self.image = imageURL
    }
}
