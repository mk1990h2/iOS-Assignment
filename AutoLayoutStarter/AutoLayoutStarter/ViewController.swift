//
//  ViewController.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let purpleBox: UIView = {
        let purple = UIView(frame: CGRect.zero)
        // important when setting contraints programmatically
        purple.translatesAutoresizingMaskIntoConstraints = false
        purple.backgroundColor = .purple
        return purple
    }()

    let redBox: UIView = {
        let orange = UIView(frame: CGRect.zero)
        // important when setting contraints programmatically
        orange.translatesAutoresizingMaskIntoConstraints = false
        orange.backgroundColor = .systemRed
        return orange
    }()

    let subOrangeBox1: UIView = {
      let orange = UIView(frame: CGRect.zero)
      // important when setting contraints programmatically
      orange.translatesAutoresizingMaskIntoConstraints = false
    orange.backgroundColor = .orange
      return orange
    }()

    let subOrangeBox2: UIView = {
      let orange = UIView(frame: CGRect.zero)
      // important when setting contraints programmatically
      orange.translatesAutoresizingMaskIntoConstraints = false
      orange.backgroundColor = .orange
      return orange
    }()
    
    let stack: UIStackView = {
        let s = UIStackView()
        s.axis = .vertical
        s.distribution = .equalSpacing
        s.translatesAutoresizingMaskIntoConstraints = false
        
        for _ in 0..<3 {
            let blueBox = UIView()
            NSLayoutConstraint.activate([
                blueBox.heightAnchor.constraint(equalToConstant: 50),
                blueBox.widthAnchor.constraint(equalToConstant: 50),
            ])
            blueBox.backgroundColor = .blue
            s.addSubview(blueBox)
        }
        return s
    }()

  let mainView: UIView = {
    let main = UIView()
    // important when setting contraints programmatically
    main.translatesAutoresizingMaskIntoConstraints = false
    main.backgroundColor = .green
    return main
  }()
  
  let squareButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Square", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
    return butt
  }()
  
  let portraitButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Portrait", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
    return butt
  }()
  
  let landScapeButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Landscape", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
    return butt
  }()
  
  var widthAnchor: NSLayoutConstraint?
  var heightAnchor: NSLayoutConstraint?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(mainView)
    setupLayout()
  }

  fileprivate func setupLayout() {
    mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
    widthAnchor?.isActive = true
    
    // Add a purple box
    mainView.addSubview(purpleBox)
    NSLayoutConstraint.activate([
        purpleBox.heightAnchor.constraint(equalToConstant: 60),
        purpleBox.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.6),
        purpleBox.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20),
        purpleBox.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20)
    ])
    
    // Add a red box
    mainView.addSubview(redBox)
    NSLayoutConstraint.activate([
        redBox.heightAnchor.constraint(equalToConstant: 70),
        redBox.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.4),
        redBox.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20),
        redBox.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20)
    ])

    // Add two small orange boxes
    redBox.addSubview(subOrangeBox1)
    NSLayoutConstraint.activate([
        subOrangeBox1.heightAnchor.constraint(equalToConstant: 50),
        subOrangeBox1.widthAnchor.constraint(equalTo: redBox.widthAnchor, multiplier: 0.3),
        subOrangeBox1.topAnchor.constraint(equalTo: redBox.topAnchor, constant: 10),
        subOrangeBox1.trailingAnchor.constraint(equalTo: redBox.trailingAnchor, constant: -15)
    ])
    redBox.addSubview(subOrangeBox2)
    NSLayoutConstraint.activate([
        subOrangeBox2.heightAnchor.constraint(equalToConstant: 50),
        subOrangeBox2.widthAnchor.constraint(equalTo: redBox.widthAnchor, multiplier: 0.5),
        subOrangeBox2.topAnchor.constraint(equalTo: redBox.topAnchor, constant: 10),
        subOrangeBox2.leadingAnchor.constraint(equalTo: redBox.leadingAnchor, constant: 15)
    ])
    
    // Add three blue boxes
    mainView.addSubview(stack)
    NSLayoutConstraint.activate([
        stack.heightAnchor.constraint(equalTo: mainView.heightAnchor),
        stack.widthAnchor.constraint(equalTo: mainView.widthAnchor),
        stack.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 0),
        stack.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: 0)
    ])

    heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
    heightAnchor?.isActive = true
    
    let buttStackView = UIStackView(arrangedSubviews: [
      squareButton, portraitButton, landScapeButton])
    buttStackView.translatesAutoresizingMaskIntoConstraints = false
    buttStackView.axis = .horizontal
    buttStackView.alignment = .center
    buttStackView.distribution = .fillEqually
    
    view.addSubview(buttStackView)
    NSLayoutConstraint.activate([
      buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttStackView.heightAnchor.constraint(equalToConstant: 50),
      buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
      ])
  }

  @objc private func squareTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
  
  @objc private func portraitTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
    
  }
  
  @objc private func landscapeTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
}

