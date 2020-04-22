//
//  BaseViewController.swift
//  RainbowTabs
//
//  Created by 佐藤美佳 on 2020/04/22.
//  Copyright © 2020 Mika Sato. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    let centerBtn: UIButton = {
        let btn = CenterButton()
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(centerBtn)
        centerBtn.addTarget(self, action: #selector(goToNextViewController), for: .touchUpInside)
        centerBtn.centerInSuperView()
    }
    
    @objc func goToNextViewController(_ sender: UIButton) {
        preconditionFailure("This method must be overridden")
    }
}
