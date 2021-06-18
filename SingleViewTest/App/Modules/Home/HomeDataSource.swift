//
//  HomeDataSource.swift
//  SingleViewTest
//
//  Created by Arturo on 6/17/21.
//

import UIKit

final class HomeDataSource: NSObject {
    private let reusableIdentifier = "NumberCell"
    private var items: [NumberType] = []

    weak var collectionView: UICollectionView? {
        didSet {
            setupCollectionView()
        }
    }

    func updateResult(_ result: [NumberType]) {
        self.items = result
        collectionView?.reloadData()
    }

    private func setupCollectionView() {
        guard let collectionView = collectionView else { return }
        collectionView.register(UINib(nibName: String(describing: NumberTypeCell.self), bundle: nil), forCellWithReuseIdentifier: reusableIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension HomeDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableIdentifier, for: indexPath)
        if let numberCell = cell as? NumberTypeCell {
            numberCell.update(with: items[indexPath.row])
        }
        return cell
    }
}

extension HomeDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 2, height: collectionView.bounds.width / 2)
    }
}
