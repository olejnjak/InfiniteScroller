//
//  ViewController.swift
//  InfiniteScroller Example
//
//  Created by Jakub Olejník on 03/08/2018.
//  Copyright © 2018 Jakub Olejník. All rights reserved.
//

import UIKit
import InfiniteScroller

final class ViewController: UIViewController {

    private var page = 1 { didSet { tableView.reloadData() } }
    private let pageSize = 5
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        tableView.infiniteScroller.nextPageAction = { [weak self] completion in
            self?.page += 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                completion()
            }
        }
        tableView.infiniteScroller.start()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return page * pageSize
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Cell " + String(indexPath.row)
        return cell
    }
}
