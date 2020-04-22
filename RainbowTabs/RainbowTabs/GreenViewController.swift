//
//  GreenViewController.swift
//  RainbowTabs
//
//  Created by 佐藤美佳 on 2020/04/22.
//  Copyright © 2020 Mika Sato. All rights reserved.
//

import UIKit

class GreenViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        navigationItem.title = "Green"
    }

    override func goToNextViewController(_ sender: UIButton) {
        let goVC = GoViewController()
        goVC.color = "Green"
        navigationController?.pushViewController(goVC, animated: true)
    }

}
