//
//  SectionDetailViewController.swift
//  Viaplay Technical Assessment
//
//  Created by Carlos Gonzalez2 on 13/4/24.
//

import UIKit

final class SectionDetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var interactor: SectionDetailInteractorProtocol?
    private var viewModel: ViaplaySectionDetailDomain? {
        didSet {
            guard let viewModel else { return }
            DispatchQueue.main.async {
                self.title = viewModel.viewTitle
                self.titleLabel.text = viewModel.title ?? "N/A"
                self.descriptionTextView.text = viewModel.description ?? ""
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        getData()
    }
    
    private func configureUI() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        view.backgroundColor = UIColor(hexString: "#1D1D27")

        titleLabel.font = .boldSystemFont(ofSize: 20.0)
        titleLabel.textColor = .white
        titleLabel.text = nil
        descriptionTextView.text = nil
        descriptionTextView.textColor = .white
    }
    
    private func getData() {
        Task {
            await interactor?.getSectionDetail()
        }
    }
}

extension SectionDetailViewController: SectionDetailViewProtocol {
    func update(with item: ViaplaySectionDetailDomain) {
        viewModel = item
    }
}
