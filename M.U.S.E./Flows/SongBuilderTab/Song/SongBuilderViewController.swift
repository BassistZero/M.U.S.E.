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
        setupSegmentedControl()
        setupTableView()
    }

    func setupSegmentedControl() {
        tabsSegmentedControl.setTitle(L10n.SongTabBar.Item.configuration, forSegmentAt: Tabs.configuration)

        tabsSegmentedControl.addTarget(self, action: #selector(changeTab), for: .valueChanged)
    }

    func setupTableView() {
        tableView.dataSource = self

        tableView.register(.init(nibName: "\(SetupTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(SetupTableViewCell.self)")

        tableView.separatorStyle = .none
        tableView.allowsSelection = false
    }

}

// MARK: - UITableViewDataSource

extension SongBuilderViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let identifier = getIdentifier() else { return .init() }

        return tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    }

}

// MARK: - Actions

@objc
private extension SongBuilderViewController {

    func changeTab() {
        tableView.reloadData()
    }

}

// MARK: - Private Methods

private extension SongBuilderViewController {

    func getIdentifier() -> String? {
        switch tabsSegmentedControl.selectedSegmentIndex {
        case Tabs.configuration: return "\(SetupTableViewCell.self)"

        default: return nil
        }
    }

}

// MARK: - Tabs

private extension SongBuilderViewController {

    enum Tabs {
        static let configuration = 0
    }

}
