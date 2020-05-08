//
//  AddTodoViewController.swift
//  SimpleTodoApp
//
//  Created by 佐藤美佳 on 2020/05/07.
//  Copyright © 2020 Mika Sato. All rights reserved.
//

import UIKit

class AddTodoViewController: UIViewController {
    
    @IBOutlet var todoTitle: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!

    static let unwindSegueId = "doneUnwind"
    var todo: Todo?

    override func viewDidLoad() {
        super.viewDidLoad()
        validateTextField()
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editTodoTitle(_ sender: UITextField) {
        validateTextField()
    }
    
    @IBAction func returnKeyPressed(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == AddTodoViewController.unwindSegueId {
            todo = Todo(title: todoTitle.text!, priorityNumber: 1, isCompleted: false)
        }
    }
    
    private func validateTextField() {
        let todoText = todoTitle.text ?? ""
        doneButton.isEnabled = !todoText.isEmpty
    }
    
}
