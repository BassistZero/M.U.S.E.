import UIKit

final class StructureTableViewCell: UITableViewCell {

    // MARK: - Private Outlets

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var addRowButton: UIButton!

    // MARK: - Public Properties

    var song: Song?

    // MARK: - Private Properties

    private var numberOfRows: [Int] = []

    // MARK: - UIViewController

    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }

}

// MARK: - Configuration

private extension StructureTableViewCell {

    func setupInitialState() {
        tableView.dataSource = self

        tableView.register(.init(nibName: "\(StructurePartTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(StructurePartTableViewCell.self)")

        var configuration = UIButton.Configuration.filled()
        configuration.image = .init(systemName: "plus.circle.fill")
        configuration.imagePadding = 8
        configuration.cornerStyle = .large

        var attributedTitle = AttributedString(stringLiteral: L10n.SongBuilder.Detail.addNewStructurePart)
        attributedTitle.font = .systemFont(ofSize: 16)

        configuration.attributedTitle = attributedTitle

        addRowButton.configuration = configuration

        addRowButton.addTarget(self, action: #selector(addNewRow), for: .touchUpInside)
    }

    @objc
    func addNewRow() {
        numberOfRows += [0]
        tableView.reloadData()
    }

}

// MARK: - UITableViewDataSource

extension StructureTableViewCell: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfRows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(StructurePartTableViewCell.self)", for: indexPath)

        guard let cell = cell as? StructurePartTableViewCell else { return .init() }
        cell.accessoryType = .disclosureIndicator

        return cell
    }

}
