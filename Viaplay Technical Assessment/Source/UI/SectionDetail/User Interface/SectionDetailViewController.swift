//
//  SectionDetailViewController.swift
//  Viaplay Technical Assessment
//
//  Created by Carlos Gonzalez2 on 13/4/24.
//

import UIKit

final class SectionDetailViewController: UIViewController {
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var interactor: SectionDetailInteractorProtocol?
    var uri: URL?
    private var viewModel: ViaplaySectionDetailDomain? {
        didSet {
            guard let viewModel else { return }
            DispatchQueue.main.async {
                if let title = viewModel.title {
                    self.navigationItem.title = title
                }
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
        descriptionTextView.text = nil
        descriptionTextView.textColor = .black
    }
    
    private func getData() {
        Task {
            await interactor?.getSectionDetail(from: uri)
        }
    }
}

extension SectionDetailViewController: SectionDetailViewProtocol {
    func update(with item: ViaplaySectionDetailDomain) {
        viewModel = item
    }
}
