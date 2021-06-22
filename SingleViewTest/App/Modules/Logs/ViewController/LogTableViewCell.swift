//
//  LogTableViewCell.swift
//  SingleViewTest
//
//  Created by Arturo on 6/20/21.
//

import UIKit

class LogTableViewCell: UITableViewCell {
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var inputLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func updateCell(with log: LogEntry) {
        dateLabel.text = log.dateFormatted
        inputLabel.text = log.input
    }
}
