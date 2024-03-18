//
//  EmployeeTableViewController.swift
//  EmployeeRoster
//
//  Created by Jordan Fraughton on 3/17/24.
//

import UIKit

protocol EmployeeTypeTableViewControllerDelegate {
    func employeeTypeTableViewController(_ controller: EmployeeTypeTableViewController, didSelect employeeType: EmployeeType)
}

class EmployeeTypeTableViewController: UITableViewController {
    var delegate: EmployeeTypeTableViewControllerDelegate?
    var employeeType: EmployeeType?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EmployeeType.allCases.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = EmployeeType.allCases[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeTypeCell", for: indexPath)

        var content = cell.defaultContentConfiguration()
        content.text = type.description
        cell.contentConfiguration = content

        if employeeType == type {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let employeeType = EmployeeType.allCases[indexPath.row]
        self.employeeType = employeeType
        tableView.reloadData()
        delegate?.employeeTypeTableViewController(self, didSelect: employeeType)
    }
}

