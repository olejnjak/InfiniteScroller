import UIKit
import InfiniteScroller

final class ViewController: UIViewController {

    private var page = 1 { didSet { tableView.reloadData() } }
    private let pageSize = 5
    
    @IBOutlet weak var tableView: UITableView!
    
    private lazy var infiniteScroller = Scroller(scrollView: tableView)
    
    // MARK: Initializers
    
    deinit {
        print("⚰️ [DEINIT]", self)
    }
    
    // MARK: View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        infiniteScroller.nextPageAction = { [weak self] completion in
            self?.page += 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                completion()
            }
        }
        
        infiniteScroller.start()
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
