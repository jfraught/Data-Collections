//
//  StoreItemTableViewDiffableDataSource.swift
//  iTunesSearch
//
//  Created by Jordan Fraughton on 5/12/24.
//

import UIKit

@MainActor
class StoreItemTableViewDiffableDataSource: UITableViewDiffableDataSource<String, StoreItem.ID> {
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return snapshot().sectionIdentifiers[section]
    }
}
