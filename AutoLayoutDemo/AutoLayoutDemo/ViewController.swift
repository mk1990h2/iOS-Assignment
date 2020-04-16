//
//  ViewController.swift
//  AutoLayoutDemo
//
//  Created by Derrick Park on 4/15/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    let w = view.bounds.size.width / 3
    
    let btn = UIButton()
    btn.setTitle("Let's Go", for: .normal)
    btn.backgroundColor = .red
    btn.translatesAutoresizingMaskIntoConstraints = false
    btn.widthAnchor.constraint(equalToConstant: w).isActive = true
    
    let btn1 = UIButton()
    btn1.setTitle("Bye", for: .normal)
    btn1.backgroundColor = .red
    btn1.translatesAutoresizingMaskIntoConstraints = false
    
    btn1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0).isActive = true
    
    btn1.widthAnchor.constraint(equalToConstant: w).isActive = true
    
    let vStackView = UIStackView(arrangedSubviews: [btn, btn1])
    vStackView.axis = .vertical
    vStackView.distribution = .fillEqually
    vStackView.alignment = .center
    vStackView.translatesAutoresizingMaskIntoConstraints = false
    vStackView.spacing = 30
    view.addSubview(vStackView)
    
    vStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
    vStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    
//    btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
//    btn.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
//    btn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive = true
//    btn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
    
  }


}

