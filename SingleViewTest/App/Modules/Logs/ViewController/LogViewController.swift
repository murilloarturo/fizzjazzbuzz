//
//  LogViewController.swift
//  SingleViewTest
//
//  Created by Arturo on 6/20/21.
//

import UIKit

class LogViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    private let reuseIndetifier = "LogCell"
    private let showDetailSegueIndetifier = "showDetail"
    private var items: [LogEntry] = []
    private let viewModel = LogViewModel()

    private var log: [Any] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let item = sender as? LogEntry {
            print(item)
            (segue.destination as? LogDetailViewController)?.updateCurrentLog(with: item)
        }
    }
}

private extension LogViewController {
    func setup(){
        title = "Log"
        items = viewModel.getLogs()
        tableView.register(UINib(nibName: String(describing: LogTableViewCell.self), bundle: nil), forCellReuseIdentifier: reuseIndetifier)
    }
}

extension LogViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIndetifier, for: indexPath) as? LogTableViewCell else {
            return LogTableViewCell()
        }
        cell.updateCell(with: items[indexPath.row])
        return cell
    }
}

extension LogViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: showDetailSegueIndetifier, sender: items[indexPath.row])
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
