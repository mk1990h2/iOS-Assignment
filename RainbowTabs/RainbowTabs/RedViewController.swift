//
//  ViewController.swift
//  RainbowTabs
//
//  Created by 佐藤美佳 on 2020/04/22.
//  Copyright © 2020 Mika Sato. All rights reserved.
//

import UIKit

class RedViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        navigationItem.title = "Red"
    }

    override func goToNextViewController(_ sender: UIButton) {
        let goVC = GoViewController()
        goVC.color = "Red"
        navigationController?.pushViewController(goVC, animated: true)
    }
    
}
