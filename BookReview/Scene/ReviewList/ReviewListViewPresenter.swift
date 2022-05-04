//
//  ReviewListViewPresenter.swift
//  BookReview
//
//  Created by kmjmarine on 2022/04/21.
//

import UIKit
import Kingfisher

protocol ReviewListProtocol {
    func setupNavigationBar()
    func setupViews()
    func presentToReivewWriteViewController()
    func reloadTableView()
}

final class ReviewListViewPresenter: NSObject {
    private let viewController: ReviewListProtocol
    private let userDefaultsManager = UserDefaultsManager()
    
    private var review: [BookReview] = [ ]
    
    init(viewController: ReviewListProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController.setupNavigationBar()
        viewController.setupViews()
    }
    
    func viewWillAppear() {
        review = userDefaultsManager.getReviews()
        viewController.reloadTableView()
    }
    
    func didTapRightBarButtonItem() {
        viewController.presentToReivewWriteViewController()
    }
}

extension ReviewListViewPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        review.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let review = review[indexPath.row]
        cell.textLabel?.text = review.title
        cell.detailTextLabel?.text = review.contents
        cell.imageView?.kf.setImage(with: review.imageURL, placeholder: .none) { _ in
            cell.setNeedsLayout()
        }
        
        cell.selectionStyle = .none
        
        return cell
    }
}
