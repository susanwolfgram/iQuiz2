//
//  QuizCell.swift
//  iQuizDemo
//
//  Created by Susan Wolfgram on 11/10/15.
//  Copyright © 2015 Susan Wolfgram. All rights reserved.
//

import UIKit

class QuizCell: UITableViewCell {

    @IBOutlet weak var quizimage: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var quizquestion: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
