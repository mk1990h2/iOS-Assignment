//
//  BlueViewController.swift
//  RainbowTabs
//
//  Created by 佐藤美佳 on 2020/04/22.
//  Copyright © 2020 Mika Sato. All rights reserved.
//

import UIKit

class BlueViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        navigationItem.title = "Blue"
    }

    override func goToNextViewController(_ sender: UIButton) {
        let goVC = GoViewController()
        goVC.color = "Blue"
        navigationController?.pushViewController(goVC, animated: true)
    }

}
