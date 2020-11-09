//
//  ViewController.swift
//  Telstra_Test
//
//  Created by Dinesh Reddy on 09/11/20.
//

import UIKit

class ViewController: BaseViewController {
    var itemsTableView: UITableView?
    private let refreshController = UIRefreshControl()
    private let cellIdentifier = "FactsListTableViewCell"

    var interactor: FactsListInteractorInput?
    var itemsToPresent = [Item]() {
        didSet {
            DispatchQueue.main.async {
                self.itemsTableView?.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFactsListInteractor()
        fetchFactsList()
        setupTableView()
        // Do any additional setup after loading the view.
    }
    
    private func setupTableView() {
        itemsTableView = UITableView()
        itemsTableView.map(self.view.addSubview(_:))
        itemsTableView?.register(FactsListTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        itemsTableView?.pin(to: view)
        itemsTableView?.dataSource = self
        itemsTableView?.delegate = self
        itemsTableView?.estimatedRowHeight = 100
        itemsTableView?.rowHeight = UITableView.automaticDimension
        refreshController.addTarget(self, action: #selector(pullToRefreshPerformed), for: .valueChanged)
        itemsTableView?.refreshControl = refreshController
    }
    
    @objc private func pullToRefreshPerformed() {
        fetchFactsList()
    }
    
    private func setupFactsListInteractor() {
        interactor = FactsListViewFactory.createFactsViewFactory(view: self)
    }
    
    private func fetchFactsList() {
        showActivityIndicator()
        interactor?.fetchFactsList()
    }
    
    private func updateFactsList(items: [Item]) {
        itemsToPresent = items
    }
    
    private func presentPageTitle(title: String) {
        DispatchQueue.main.async {
            self.hideActivityIndicator()
            self.refreshController.endRefreshing()
            self.title = title
        }
    }
}

extension ViewController: FactsListPresenterOutput {
    func displayFactsList(items: [Item]) {
        updateFactsList(items: items)
    }
    
    func displayPageTitle(pageTitle: String) {
        presentPageTitle(title: pageTitle)
    }
    
    func displayErrorMessage(message: String) {
        // Implement showing error message banner in the app here
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsToPresent.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let itemListCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? FactsListTableViewCell else {
            return UITableViewCell()
        }
        itemListCell.setupItemInformation(item: itemsToPresent[indexPath.row])
        return itemListCell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
