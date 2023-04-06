import UIKit

final class SongBuilderViewController: UIViewController {

    // MARK: - Private Outlets

    @IBOutlet private weak var tabsSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
    }

}

// MARK: - Configuration

private extension SongBuilderViewController {

    func setupInitialState() {
        setupTableView()
    }
    func setupTableView() {
        tableView.dataSource = self

        tableView.separatorStyle = .none
        tableView.allowsSelection = false
    }

}
