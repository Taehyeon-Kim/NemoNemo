//
//  MemoTableViewCell.swift
//  NemoNemo
//
//  Created by taehy.k on 2021/01/16.
//

import UIKit

class MemoTableViewCell: UITableViewCell {

    @IBOutlet weak var groupCircle: RoundedUIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
        setupFont()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI() {
        groupCircle.layer.borderColor = UIColor.black.cgColor
        groupCircle.layer.borderWidth = 2
    }
    
    func setupFont() {
        titleLabel.font = UIFont.NEXONLv1GothicFontSize(weight: .Regular, size: 16)
    }
    
    func setData(_ data: String) {
        titleLabel.text = data
    }
}
