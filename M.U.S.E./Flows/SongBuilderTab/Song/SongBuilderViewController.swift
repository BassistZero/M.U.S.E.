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
        tabsSegmentedControl.setTitle(L10n.SongTabBar.Item.structure, forSegmentAt: Tabs.structure)
        tabsSegmentedControl.setTitle(L10n.SongTabBar.Item.instruments, forSegmentAt: Tabs.instruments)
        tabsSegmentedControl.setTitle(L10n.SongTabBar.Item.result, forSegmentAt: Tabs.result)

        tabsSegmentedControl.addTarget(self, action: #selector(changeTab), for: .valueChanged)
    }

    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(.init(nibName: "\(SetupTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(SetupTableViewCell.self)")
        tableView.register(.init(nibName: "\(StructureTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(StructureTableViewCell.self)")
        tableView.register(.init(nibName: "\(InstrumentsTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(InstrumentsTableViewCell.self)")
        tableView.register(.init(nibName: "\(ResultTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(ResultTableViewCell.self)")

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

// MARK: - UITableViewDelegate

extension SongBuilderViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let identifier = getIdentifier() else { return .init() }

        if identifier == "\(StructureTableViewCell.self)" {
            return tableView.frame.height
        }

        return UITableView.automaticDimension
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
        case Tabs.structure: return "\(StructureTableViewCell.self)"
        case Tabs.instruments: return "\(InstrumentsTableViewCell.self)"
        case Tabs.result: return "\(ResultTableViewCell.self)"

        default: return nil
        }
    }

}

// MARK: - Tabs

private extension SongBuilderViewController {

    enum Tabs {
        static let configuration = 0
        static let structure = 1
        static let instruments = 2
        static let result = 3
    }

}
