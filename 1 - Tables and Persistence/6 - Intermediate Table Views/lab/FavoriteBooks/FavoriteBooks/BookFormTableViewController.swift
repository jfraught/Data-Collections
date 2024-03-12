//
//  BookFormTableViewController.swift
//  FavoriteBooks
//
//  Created by Jordan Fraughton on 3/10/24.
//

import UIKit

class BookFormTableViewController: UITableViewController {

    var book: Book?

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var authorTextField: UITextField!
    @IBOutlet var genreTextField: UITextField!
    @IBOutlet var lengthTextField: UITextField!
    @IBOutlet var saveButton: UIBarButtonItem!

    init?(coder: NSCoder, book: Book?) {
        self.book = book
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        self.book = nil
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        updateView()
        updateSaveButtonState()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "saveUnwind" else { return }

        let title = titleTextField.text ?? ""
        let author = authorTextField.text ?? ""
        let genre = genreTextField.text ?? ""
        let length = lengthTextField.text ?? ""

        book = Book(title: title, author: author, genre: genre, length: length)
    }

    func updateView() {
        if let book {
            titleTextField.text = book.title
            authorTextField.text = book.author
            genreTextField.text = book.genre
            lengthTextField.text = book.length
            title = "Edit Book"
        } else {
            title = "Add Book"
        }
    }

    func updateSaveButtonState() {
        let titleText = titleTextField.text ?? ""
        let authorText = authorTextField.text ?? ""
        let genreText = genreTextField.text ?? ""
        let lengthText = lengthTextField.text ?? ""
        saveButton.isEnabled = !titleText.isEmpty && !authorText.isEmpty && !genreText.isEmpty && !lengthText.isEmpty

    }

    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
}
