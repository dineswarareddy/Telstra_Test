//
//  FactsListTableViewCell.swift
//  Telstra_Test
//
//  Created by Dinesh Reddy on 09/11/20.
//

import UIKit

class FactsListTableViewCell: UITableViewCell {
    var itemImageView = ItemImageView()
    var itemTitleLabel = UILabel()
    var itemDescriptionLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupAllSubViews()
        setImageViewConstraint()
        setTitleLabelConstraint()
        setDescriptionLabelConstraint()
    }
    
    private func setupAllSubViews() {
        itemImageView.layer.cornerRadius = 8
        itemImageView.clipsToBounds = true
        itemTitleLabel.numberOfLines = 0
        itemTitleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        itemDescriptionLabel.numberOfLines = 0
        self.addSubview(itemImageView)
        self.addSubview(itemTitleLabel)
        self.addSubview(itemDescriptionLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImageViewConstraint() {
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        itemImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        itemImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        itemImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        itemImageView.heightAnchor.constraint(equalTo: itemImageView.widthAnchor, multiplier: 1).isActive = true
        self.bottomAnchor.constraint(greaterThanOrEqualTo: itemImageView.bottomAnchor, constant: 10).isActive = true
    }
    
    func setTitleLabelConstraint() {
        itemTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        itemTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        itemTitleLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 10).isActive = true
        itemTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        itemTitleLabel.setContentHuggingPriority(.fittingSizeLevel, for: .vertical)
    }
    
    func setDescriptionLabelConstraint() {
        itemDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        itemDescriptionLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 10).isActive = true
        itemDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        itemDescriptionLabel.topAnchor.constraint(equalTo: itemTitleLabel.bottomAnchor, constant: 10).isActive = true
        self.bottomAnchor.constraint(greaterThanOrEqualTo: itemDescriptionLabel.bottomAnchor, constant: 10).isActive = true
    }

    func setupItemInformation(item: Item) {
        if let imageHref = item.imageHref, let imageURL = URL(string: imageHref) {
            itemImageView.imageFromServerURL(imageURL)
        } else {
            itemImageView.image = #imageLiteral(resourceName: "placeHolder")
        }
        itemTitleLabel.text = item.title ?? "-"
        itemDescriptionLabel.text = item.description ?? "-"
    }
}
