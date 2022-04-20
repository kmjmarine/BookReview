//
//  ReviewListViewController.swift
//  BookReview
//
//  Created by kmjmarine on 2022/04/21.
//

import UIKit

final class ReviewListViewController: UIViewController {
    
    private lazy var presenter = ReviewListViewPresenter(viewController: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ReviewListViewController: ReviewListProtocol {}
