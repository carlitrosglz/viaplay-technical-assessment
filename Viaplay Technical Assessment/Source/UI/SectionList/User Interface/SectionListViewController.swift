//
//  SectionListViewController.swift
//  Viaplay Technical Assessment
//
//  Created by Carlos Gonzalez Espejo on 13/4/24.
//

import UIKit

final class SectionListViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var router: AppRouterProtocol?
    var interactor: SectionListInteractorProtocol?
    
    private let itemsPerRow = 2.0
    private var viewModel: [ViaplaySectionDomain]? {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        getData()
    }
    
    private func configureUI() {
        view.backgroundColor = UIColor(hexString: "#1D1D27")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self,forCellWithReuseIdentifier: String(describing:UICollectionViewCell.self))
        
        titleLabel.text = "Viaplay Section List"
        titleLabel.textColor = .white
        titleLabel.font = .boldSystemFont(ofSize: 30.0)
    }
    
    private func getData() {
        Task {
            await interactor?.getSections()
        }
    }
}

extension SectionListViewController: SectionListViewProtocol {
    func update(items: [ViaplaySectionDomain]) {
        self.viewModel = items
    }
}

extension SectionListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let viewModel, let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SimpleTextCell.ID, for: indexPath) as? SimpleTextCell else {
            return collectionView.dequeueReusableCell(withReuseIdentifier: String(describing:UICollectionViewCell.self), for: indexPath)
        }
        
        cell.delegate = self
        cell.viewModel = SimpleTextCellViewModel(id: viewModel[indexPath.row].id, name: viewModel[indexPath.row].name)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        router?.showSectionDetail(navigationController: self.navigationController, with: viewModel?[indexPath.row].uri)
    }
}

extension SectionListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (collectionView.frame.width - 30 ) / 2        
        return CGSize(width: cellWidth , height: 40)
    }
}

extension SectionListViewController: SimpleTextCellProtocol {
    func onButtonPressed(id: String?) {
        if let viewModel = viewModel?.first(where: { $0.id == id }) {
            router?.showSectionDetail(navigationController: self.navigationController, with: viewModel.uri)
        }
    }
}
