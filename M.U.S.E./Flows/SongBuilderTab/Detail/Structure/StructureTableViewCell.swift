import UIKit

final class StructureTableViewCell: UITableViewCell, SongBuilderTableViewCell {

    // MARK: - Private Outlets

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var addRowButton: UIButton!
    @IBOutlet private weak var addRowButtonBottomConstraint: NSLayoutConstraint!

    // MARK: - SongBuilderTableViewCell

    var song: Song?
    var rootNavigationController: UINavigationController?

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
        setupTableView()
        setupButtons()
        print(song)
        print(rootNavigationController)
    }

    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(.init(nibName: "\(StructurePartTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(StructurePartTableViewCell.self)")

        let buttonHeight = addRowButton.frame.height
        let buttonBottomSpacer = addRowButtonBottomConstraint.constant

        tableView.contentInset = .init(top: 0, left: 0, bottom: buttonHeight + buttonBottomSpacer, right: 0)
    }

    func setupButtons() {
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
        let indexPath = IndexPath(row: numberOfRows.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
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

// MARK: - UITableViewDelegate

extension StructureTableViewCell: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let cell = tableView.dequeueReusableCell(withIdentifier: "\(StructurePartTableViewCell.self)", for: indexPath)

        guard
            let cell = cell as? StructurePartTableViewCell,
            let title = cell.title
        else { return }

        let vc = UIViewController()
        vc.view.backgroundColor = .systemBrown
        vc.title = title

        print(song)
        print(rootNavigationController)

        rootNavigationController?.pushViewController(vc, animated: true)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            let index = indexPath.row
            numberOfRows.remove(at: index)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        default: break
        }
    }

}
