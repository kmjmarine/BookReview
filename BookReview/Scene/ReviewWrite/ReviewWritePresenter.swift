//
//  ReviewWritePresenter.swift
//  BookReview
//
//  Created by kmjmarine on 2022/04/21.
//

import Foundation

protocol ReviewWriteProtocol {
    func setupNavigationBar()
    func showCloseAlertController()
    func close()
    func setupViews()
    func presentToSearchBookViewController()
    func updateViews(title: String, imageURL: URL?)
}

final class ReviewWritePresenter {
    private let viewController: ReviewWriteProtocol
    private let userDefaultsManager: UserDefaultsManagerProtocol
    
    var book: Book?
    
    let contentTextViewPlaceHolderText = "내용을 입력해 주세요."
    
    init(
        viewController: ReviewWriteProtocol,
        userDefaultManager: UserDefaultsManagerProtocol = UserDefaultsManager()
    ) {
        self.viewController = viewController
        self.userDefaultsManager = userDefaultManager
    }
    
    func viewDidLoad() {
        viewController.setupNavigationBar()
        viewController.setupViews()
    }
    
    func didTapLeftBarButton() {
        viewController.showCloseAlertController()
    }
    
    func didTapRightBarButton(contentsText: String?) {
        guard
            let book = book,
            let contentsText = contentsText,
            contentsText != contentTextViewPlaceHolderText
        else { return }
        
        let bookReview =  BookReview(
            title: book.title,
            contents: contentsText,
            imageURL: book.imageURL
        )
        userDefaultsManager.setReviews(bookReview)
        
        viewController.close()
    }
    
    func didTapBookTitleButton() {
        viewController.presentToSearchBookViewController()
    }
}

extension ReviewWritePresenter: SearchBookDelegate {
    func selectBook(_ book: Book) {
        self.book = book
        
        viewController.updateViews(title: book.title, imageURL: book.imageURL)
    }
}
