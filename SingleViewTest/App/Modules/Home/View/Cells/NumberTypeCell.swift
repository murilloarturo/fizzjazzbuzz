//
//  NumberTypeCell.swift
//  SingleViewTest
//
//  Created by Arturo on 6/17/21.
//

import UIKit

class NumberTypeCell: UICollectionViewCell {
    @IBOutlet private weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func update(with type: NumberType) {
//        titleLabel.attributedText = type.title
    }
}
