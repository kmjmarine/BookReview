//
//  MockUserDefaultsManager.swift
//  BookReviewTests
//
//  Created by kmjmarine on 2022/05/05.
//

import Foundation

@testable import BookReview

final class MockUserDefaultsManager: UserDefaultsManagerProtocol {
    var isCalledGetReviews = false
    var isCalledSetReviews = false
    
    func getReviews() -> [BookReview] {
        isCalledGetReviews = true
        
        return [ ]
    }
    
    func setReviews(_ newValue: BookReview) {
        isCalledSetReviews = true
    }
}
