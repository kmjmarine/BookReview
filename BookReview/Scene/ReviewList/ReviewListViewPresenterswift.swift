//
//  ReviewListViewPresenterswift.swift
//  BookReview
//
//  Created by kmjmarine on 2022/04/21.
//

import Foundation

protocol ReviewListProtocol {}

final class ReviewListViewPresenter {
    private let viewController: ReviewListProtocol
    
    init(viewController: ReviewListProtocol) {
        self.viewController = viewController
    }
}

