//
//  EditTodoViewController.swift
//  SimpleTodoApp
//
//  Created by 佐藤美佳 on 2020/05/08.
//  Copyright © 2020 Mika Sato. All rights reserved.
//

import UIKit

class EditTodoViewController: UIViewController {

    @IBOutlet weak var todoTitle: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!

    static let unwindSegueId = "doneUnwindEdit"
    var todo: Todo?
    var indexPath: IndexPath?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        todoTitle.text = todo?.title
        validateTextField()
    }
    
    @IBAction func onEditTodoTitle(_ sender: UITextField) {
        validateTextField()
    }
    
    @IBAction func returnKeyPressed(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        todo?.title = todoTitle.text!
    }
    
    private func validateTextField() {
        let todoText = todoTitle.text ?? ""
        doneButton.isEnabled = !todoText.isEmpty
    }
}
