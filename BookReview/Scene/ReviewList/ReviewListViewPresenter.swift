//
//  ReviewListViewPresenter.swift
//  BookReview
//
//  Created by kmjmarine on 2022/04/21.
//

import UIKit

protocol ReviewListProtocol {
    func setupNavigationBar()
    func setupViews()
    func presentToReivewWriteViewController()
    func reloadTableView()
}

final class ReviewListViewPresenter: NSObject {
    private let viewController: ReviewListProtocol
    
    init(viewController: ReviewListProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController.setupNavigationBar()
        viewController.setupViews()
    }
    
    func viewWillAppear() {
        // TODO: UserDefaults 내용 업데이트 하기
        viewController.reloadTableView()
    }
    
    func didTapRightBarButtonItem() {
        viewController.presentToReivewWriteViewController()
    }
}

extension ReviewListViewPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = "\(indexPath)"
        
        return cell
    }
}
