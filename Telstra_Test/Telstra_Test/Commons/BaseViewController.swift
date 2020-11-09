//
//  BaseViewController.swift
//  Telstra_Test
//
//  Created by Dinesh Reddy on 09/11/20.
//

import UIKit

class BaseViewController: UIViewController {
    var activityIndicator: UIActivityIndicatorView?
    // To show activity indicator on top of view controller.
    func showActivityIndicator() {
        if activityIndicator != nil {
            startActivityAnimation()
            return
        }
        addActivityIndicator()
    }
    
    private func startActivityAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now()) { [weak self] in
        guard let `self` = self else { return }
            self.activityIndicator.map(self.view.addSubview(_:))
            self.activityIndicator?.startAnimating()
        }
    }
    
    private func addActivityIndicator() {
        DispatchQueue.main.asyncAfter(deadline: .now()) { [weak self] in
            guard let `self` = self else { return }
            self.activityIndicator = UIActivityIndicatorView()
            self.activityIndicator.map(self.view.addSubview(_:))
            self.addActivityIndiactorConstraints()
            self.activityIndicator?.hidesWhenStopped = true
            if #available(iOS 13.0, *) {
                self.activityIndicator?.style = .medium
            } else {
                // Fallback on earlier versions
                self.activityIndicator?.style = .gray
            }
            self.startActivityAnimation()
        }
    }
    
    func addActivityIndiactorConstraints() {
        activityIndicator?.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator?.widthAnchor.constraint(equalToConstant: 40).isActive = true
        activityIndicator?.heightAnchor.constraint(equalToConstant: 40).isActive = true
        activityIndicator?.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicator?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    // To hide activity indicator.
    func hideActivityIndicator() {
        DispatchQueue.main.asyncAfter(deadline: .now()) { [weak self] in
            self?.activityIndicator?.stopAnimating()
        }
    }
}
