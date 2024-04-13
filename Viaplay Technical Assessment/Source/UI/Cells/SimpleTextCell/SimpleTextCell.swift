//
//  SimpleTextCell.swift
//  Viaplay Technical Assessment
//
//  Created by Carlos Gonzalez2 on 13/4/24.
//

import UIKit

final class SimpleTextCell: UICollectionViewCell {
    static let ID = "SimpleTextCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var viewModel: SimpleTextCellViewModel? {
        didSet {
            guard let viewModel else { return }
            nameLabel.text = viewModel.name ?? "N/A"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
    }
    
    private func configureUI() {
        backgroundColor = .gray.withAlphaComponent(0.5)
        layer.cornerRadius = 5
        
        nameLabel.text = nil
        nameLabel.font = .systemFont(ofSize: 17.0)
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        nameLabel.lineBreakMode = .byTruncatingTail
        nameLabel.numberOfLines = 1
    }
}
