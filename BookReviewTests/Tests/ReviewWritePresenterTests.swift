//
//  ReviewWritePrsenterTests.swift
//  BookReviewTests
//
//  Created by kmjmarine on 2022/05/05.
//

import XCTest
@testable import BookReview

class ReviewWritePrsenterTests: XCTestCase {
    var sut: ReviewWritePresenter!
    var viewController: MockReviewWriteViewController!
    var userDefaultsManager: MockUserDefaultsManager!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockReviewWriteViewController()
        userDefaultsManager = MockUserDefaultsManager()
        
        sut = ReviewWritePresenter(
            viewController: viewController,
            userDefaultManager: userDefaultsManager
        )
    }
    
    override func tearDown() {
        sut = nil
        
        viewController = nil
        userDefaultsManager = nil
        
        super.tearDown()
    }
    
    func test_viewDidLoad가_호출될_때() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledSetupNavigationBar)
        XCTAssertTrue(viewController.isCalledSetupViews)
    }
    
    func test_didTapLeftBarButton이_호출될_때() {
        sut.didTapLeftBarButton()
        
        XCTAssertTrue(viewController.isCalledShowCloseAlertController)
    }
    
    func test_didTapRightBarButton이_호출될_때() {
        sut.book = Book(title: "Swift", imageURL: "")
        sut.didTapRightBarButton(contentsText: "Good book")
        
        XCTAssertTrue(userDefaultsManager.isCalledSetReviews)
        XCTAssertTrue(viewController.isCalledClose)
    }
    
    func test_didTapBookTitleButton이_호출될_때() {
        sut.didTapBookTitleButton()
        
        XCTAssertTrue(viewController.isCalledPresentToSearchBookViewController)
    }
}

final class MockReviewWriteViewController: ReviewWriteProtocol {
    var isCalledSetupNavigationBar = false
    var isCalledShowCloseAlertController = false
    var isCalledClose = false
    var isCalledSetupViews = false
    var isCalledPresentToSearchBookViewController = false
    var isCalledUpdateViews = false
    
    func setupNavigationBar() {
        isCalledSetupNavigationBar = true
    }
    
    func showCloseAlertController() {
        isCalledShowCloseAlertController = true
    }
    
    func close() {
        isCalledClose = true
    }
    
    func setupViews() {
        isCalledSetupViews = true
    }
    
    func presentToSearchBookViewController() {
        isCalledPresentToSearchBookViewController = true
    }
    
    func updateViews(title: String, imageURL: URL?) {
        isCalledUpdateViews = true
    }
}
