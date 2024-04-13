//
//  SimpleTextCell.swift
//  Viaplay Technical Assessment
//
//  Created by Carlos Gonzalez2 on 13/4/24.
//

import UIKit

final class SimpleTextCell: UICollectionViewCell {
    static let ID = "SimpleTextCell"
    
    @IBOutlet weak var nameButton: UIButton!
    
    var viewModel: SimpleTextCellViewModel? {
        didSet {
            guard let viewModel else { return }
            
            nameButton.setTitle(viewModel.name ?? "N/A", for: .normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameButton.titleLabel?.text = nil
    }
    
    private func configureUI() {
        nameButton.setTitle(nil, for: .normal)
        nameButton.setTitleColor(.white, for: .normal)
        nameButton.titleLabel?.font = .boldSystemFont(ofSize: 17.0)
        nameButton.titleLabel?.textAlignment = .center
        nameButton.titleLabel?.lineBreakMode = .byTruncatingTail
        nameButton.titleLabel?.numberOfLines = 1
    }
}
