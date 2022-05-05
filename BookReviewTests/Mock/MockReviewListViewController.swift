//
//  MockReviewListViewController.swift
//  BookReviewTests
//
//  Created by kmjmarine on 2022/05/05.
//

import Foundation

@testable import BookReview

final class MockReviewListViewController: ReviewListProtocol {
    var isCalledSetupNavigationBar = false
    var isCalledSetupViews = false
    var isCalledPresentToReivewWriteViewController = false
    var isCalledReloadTableView = false
    
    func setupNavigationBar() {
        isCalledSetupNavigationBar = true
    }
    
    func setupViews() {
        isCalledSetupViews = true
    }
    
    func presentToReivewWriteViewController() {
        isCalledPresentToReivewWriteViewController = true
    }
    
    func reloadTableView() {
        isCalledReloadTableView = true
    }
}
