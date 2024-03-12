import UIKit

class BookTableViewController: UITableViewController {
    
    var books: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 95.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        print("View Will Appear")
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookTableViewCell

        let book = books[indexPath.row]
        cell.updateWith(book: book)

        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            books.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    // MARK: - Navigation
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
//        guard let source = segue.source as? BookFormTableViewController,
//            let book = source.book else {return}
//        
//        if let indexPath = tableView.indexPathForSelectedRow {
//            books.remove(at: indexPath.row)
//            books.insert(book, at: indexPath.row)
//            tableView.deselectRow(at: indexPath, animated: true)
//        } else {
//            books.append(book)
//        }
        guard segue.identifier == "saveUnwind",
                let sourceViewController = segue.source as? BookFormTableViewController,
                let book = sourceViewController.book else { return }
        print("Unwind")

        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            books[selectedIndexPath.row] = book
            tableView.reloadRows(at: [selectedIndexPath], with: .none)
        } else {
            let newIndexPath = IndexPath(row: books.count, section: 0)
            books.append(book)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    @IBSegueAction func editBook(_ coder: NSCoder, sender: Any?) -> BookFormTableViewController? {
        guard let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else {
            return nil
        }

        let book = books[indexPath.row]

        return BookFormTableViewController(coder: coder, book: book)
    }
}
