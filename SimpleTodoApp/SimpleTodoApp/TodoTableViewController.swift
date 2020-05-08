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
    
//    var highPriority: [Todo] = [Todo]()
//    var mediumPriority: [Todo] = [Todo]()
//    var lowPriority: [Todo] = [Todo]()

    var highPriority: [Todo] = [Todo(title: "high", priorityNumber: 0, isCompleted: false)]
    var mediumPriority: [Todo] = [Todo(title: "medium", priorityNumber: 1, isCompleted: false)]
    var lowPriority: [Todo] = [Todo(title: "low", priorityNumber: 2, isCompleted: false)]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
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
        let todoList = getTodoList(section)
        return todoList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TodoTableViewCell

        let todoList = getTodoList(indexPath.section)
        let todo: Todo = todoList[indexPath.row]

        cell.updateUI(with: todo)

        return cell
    }
    
    // Delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            switch indexPath.section {
            case 0:
                highPriority.remove(at: indexPath.row)
            case 1:
                mediumPriority.remove(at: indexPath.row)
            default:
                lowPriority.remove(at: indexPath.row)
            }
        }
        
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }

    // Edit
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var todoToMove: Todo
        switch sourceIndexPath.section {
        case 0:
            todoToMove = highPriority.remove(at: sourceIndexPath.row)
        case 1:
            todoToMove = mediumPriority.remove(at: sourceIndexPath.row)
        default:
            todoToMove = lowPriority.remove(at: sourceIndexPath.row)
        }
        
        switch destinationIndexPath.section {
        case 0:
            todoToMove.priorityNumber = 0
            highPriority.insert(todoToMove, at: destinationIndexPath.row)
        case 1:
            todoToMove.priorityNumber = 1
            mediumPriority.insert(todoToMove, at: destinationIndexPath.row)
        default:
            todoToMove.priorityNumber = 2
            lowPriority.insert(todoToMove, at: destinationIndexPath.row)
        }
    }

    // Info button & arrow button
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        guard !tableView.isEditing else {
            return
        }
        performSegue(withIdentifier: "toEditTodo", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEditTodo" {
            let editVC = segue.destination as! EditTodoViewController
            let indexPath = tableView.indexPathForSelectedRow
            let todoList = getTodoList(indexPath!.section)
            editVC.todo = todoList[indexPath!.row]
        }
    }
    
    // Cell tapped
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard !tableView.isEditing else {
            return
        }
        
        switch indexPath.section {
        case 0:
            highPriority[indexPath.row].isCompleted = !highPriority[indexPath.row].isCompleted
        case 1:
            mediumPriority[indexPath.row].isCompleted = !mediumPriority[indexPath.row].isCompleted
        default:
            lowPriority[indexPath.row].isCompleted = !lowPriority[indexPath.row].isCompleted
        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }

    @IBAction func unwindToTodoTableView(segue: UIStoryboardSegue) {
        if segue.identifier == AddTodoViewController.unwindSegueId {
            let sourceVC = segue.source as! AddTodoViewController
            if let todo = sourceVC.todo {
                switch todo.priorityNumber {
                case 0:
                    highPriority.append(todo)
                    tableView.insertRows(at: [IndexPath(row: highPriority.count - 1, section: 0)], with: .automatic)
                case 1:
                    mediumPriority.append(todo)
                    tableView.insertRows(at: [IndexPath(row: mediumPriority.count - 1, section: 1)], with: .automatic)
                default:
                    lowPriority.append(todo)
                    tableView.insertRows(at: [IndexPath(row: lowPriority.count - 1, section: 2)], with: .automatic)
                }
            }
        }
    }
    
    private func getTodoList(_ priority: Int) -> [Todo] {
        if priority == 0 {
            return highPriority
        }
        if priority == 1 {
            return mediumPriority
        }
        return lowPriority
    }
    
}
