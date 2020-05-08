//
//  TodoTableViewController.swift
//  SimpleTodoApp
//
//  Created by 佐藤美佳 on 2020/05/07.
//  Copyright © 2020 Mika Sato. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {
    
    private let cellId = "TodoCell"
    
    var highPriority: [Todo] = [Todo]()
    var mediumPriority: [Todo] = [Todo]()
    var lowPriority: [Todo] = [Todo]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "High Priority"
        }
        else if section == 1 {
            return "Medium Priority"
        } else {
            return "Low Priority"
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return highPriority.count
        } else if section == 1 {
            return mediumPriority.count
        } else {
            return lowPriority.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TodoTableViewCell

        var todo: Todo
        switch indexPath.section {
        case 0:
            todo = highPriority[indexPath.row]
        case 1:
            todo = mediumPriority[indexPath.row]
        default:
            todo = lowPriority[indexPath.row]
        }

        cell.updateUI(with: todo)

        return cell
    }
    
    @IBAction func unwindToTodoTableView(segue: UIStoryboardSegue) {
        if segue.identifier == AddTodoViewController.unwindSegueId {
            let sourceVC = segue.source as! AddTodoViewController
            if let todo = sourceVC.todo {
                switch todo.priorityNumber {
                case 0:
                    highPriority.append(todo)
                case 1:
                    mediumPriority.append(todo)
                default:
                    lowPriority.append(todo)
                }
                tableView.reloadData()
            }
        }
    }

}
