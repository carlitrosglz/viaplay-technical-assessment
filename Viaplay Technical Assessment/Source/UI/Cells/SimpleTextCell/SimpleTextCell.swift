//
//  SimpleTextCell.swift
//  Viaplay Technical Assessment
//
//  Created by Carlos Gonzalez2 on 13/4/24.
//

import UIKit

protocol SimpleTextCellProtocol: AnyObject {
    func onButtonPressed(id: String?)
}

final class SimpleTextCell: UICollectionViewCell {
    static let ID = "SimpleTextCell"
    
    @IBOutlet weak var nameButton: UIButton!
    
    weak var delegate: SimpleTextCellProtocol?
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
        nameButton.setTitle(nil, for: .normal)
    }
    
    private func configureUI() {
        layer.cornerRadius = 5
        
        nameButton.backgroundColor = UIColor(hexString: "#2B2B35")
        nameButton.layer.cornerRadius = 5
        nameButton.setBackgroundImage(UIImage(color: UIColor(hexString: "#FE365F")), for: .highlighted)
        nameButton.titleLabel?.textColor = .white
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        delegate?.onButtonPressed(id: viewModel?.id)
    }
}
