//
//  studentCell.swift
//  FyyEightWork
//
//  Created by fanyunyimac on 2018/11/27.
//  Copyright © 2018年 2016110305. All rights reserved.
//

import UIKit

class studentCell: UITableViewCell {

    @IBOutlet weak var stuName: UILabel!
    @IBOutlet weak var stuDetail: UILabel!
    @IBOutlet weak var stuSno: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
