//
//  BookTableViewCell.swift
//  FavoriteBooks
//
//  Created by Jordan Fraughton on 3/11/24.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var genreLabel: UILabel!
    @IBOutlet var pagesLabel: UILabel!

    func updateWith(book: Book) {
        titleLabel.text = "Title: \(book.title)"
        authorLabel.text = "Author: \(book.author)"
        genreLabel.text = "Genre: \(book.genre)"
        pagesLabel.text = "Pages: \(book.length)"
    }

}
