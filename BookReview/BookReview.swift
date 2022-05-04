//
//  BookReview.swift
//  BookReview
//
//  Created by kmjmarine on 2022/05/04.
//

import Foundation

struct BookReview: Codable {
    let title: String
    let contents: String
    let imageURL: URL?
}
