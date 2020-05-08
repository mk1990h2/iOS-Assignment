//
//  TodoTableViewCell.swift
//  SimpleTodoApp
//
//  Created by 佐藤美佳 on 2020/05/07.
//  Copyright © 2020 Mika Sato. All rights reserved.
//

import UIKit

class TodoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var todoTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func updateUI(with todo: Todo) {
        todoTitle.text = todo.title
    }

}
