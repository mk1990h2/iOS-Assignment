//
//  ViewController.swift
//  Assignment7
//
//  Created by 佐藤美佳 on 2020/06/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var viewHightConstraint: NSLayoutConstraint!
    @IBOutlet var plusButton: UIButton!
    @IBOutlet var navBarView: UIView!
    
    private var opened = false
    private let cellId = "SnackCell"
    
    private let snackImages: [UIImageView] = [
        UIImageView(image: UIImage(named: "oreos")),
        UIImageView(image: UIImage(named: "pizza_pockets")),
        UIImageView(image: UIImage(named: "pop_tarts")),
        UIImageView(image: UIImage(named: "popsicle")),
        UIImageView(image: UIImage(named: "ramen"))
    ]
    
    private lazy var snackStack: UIStackView = {
        for snack in snackImages {
            snack.isUserInteractionEnabled = true
            snack.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.snackImageTapped(_:))))
        }
        let s = UIStackView(arrangedSubviews: snackImages)
        s.translatesAutoresizingMaskIntoConstraints = false
        s.alignment = .fill
        s.distribution = .fillEqually
        return s
    }()
    
    private lazy var snackTable: UITableView = {
        let t = UITableView()
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    private var snackList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navBarView.addSubview(self.snackStack)
        self.snackStack.heightAnchor.constraint(equalTo: self.navBarView.heightAnchor, multiplier: 0.5).isActive = true
        self.snackStack.bottomAnchor.constraint(equalTo: self.navBarView.bottomAnchor, constant: -8).isActive = true
        self.snackStack.leadingAnchor.constraint(equalTo: self.navBarView.leadingAnchor, constant: 16).isActive = true
        self.snackStack.trailingAnchor.constraint(equalTo: self.navBarView.trailingAnchor, constant: -16).isActive = true
        snackStack.isHidden = true
        
        self.view.addSubview(self.snackTable)
        self.snackTable.topAnchor.constraint(equalTo: navBarView.bottomAnchor).isActive = true
        self.snackTable.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.snackTable.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.snackTable.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.snackTable.dataSource = self
        self.snackTable.register(UITableViewCell.self, forCellReuseIdentifier: cellId)

    }
    

    @IBAction func plusButtonPressed(_ sender: Any) {
        if opened {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.35, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
                self.viewHightConstraint.constant = 88
                self.plusButton.transform = .identity
                self.snackStack.isHidden = true
                self.view.layoutIfNeeded()
            })
        } else {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.35, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
                self.viewHightConstraint.constant = 200
                self.plusButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4)
                self.snackStack.isHidden = false
                self.view.layoutIfNeeded()

            })
        }
        opened.toggle()
    }
    
    @objc private func snackImageTapped(_ recognizer: UITapGestureRecognizer) {
        if recognizer.view == snackImages[0] {
            snackList.insert("Oreos", at: 0)
        } else if recognizer.view == snackImages[1] {
            snackList.insert("Pizza Pockets", at: 0)
        } else if recognizer.view == snackImages[2] {
            snackList.insert("Pop Tarts", at: 0)
        } else if recognizer.view == snackImages[3] {
            snackList.insert("Popsicle", at: 0)
        } else if recognizer.view == snackImages[4] {
            snackList.insert("Ramen", at: 0)
        }
   
        snackTable.reloadData()
//        snackTable.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snackList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = snackList[indexPath.row]
        return cell
    }

}
