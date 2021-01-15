//
//  MemoTableViewCell.swift
//  NemoNemo
//
//  Created by taehy.k on 2021/01/15.
//

import UIKit

class MemoTableViewCell: UITableViewCell {

    @IBOutlet weak var memoContentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(_ data: String) {
        memoContentLabel.text = data
    }
}
