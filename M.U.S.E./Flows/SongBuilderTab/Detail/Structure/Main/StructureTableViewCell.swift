import UIKit

final class StructureTableViewCell: UITableViewCell, SongBuilderPart {

    // MARK: - Private Outlets

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var addRowButton: UIButton!
    @IBOutlet private weak var addRowButtonBottomConstraint: NSLayoutConstraint!

    // MARK: - SongBuilderTableViewCell

    var song: Song?
    var rootNavigationController: UINavigationController?

    // MARK: - Private Properties

    private var songParts: [SongPart] = [] {
        didSet {
            song?.structure = songParts.map { $0.structurePart }
            song?.songParts = songParts
        }
    }

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

        var attributedTitle = AttributedString(stringLiteral: L10n.SongBuilder.Detail.Structure.Main.addNewStructurePart)
        attributedTitle.font = .systemFont(ofSize: 16)

        configuration.attributedTitle = attributedTitle

        addRowButton.configuration = configuration

        addRowButton.addTarget(self, action: #selector(addNewRow), for: .touchUpInside)
    }

}

// MARK: - UITableViewDataSource

extension StructureTableViewCell: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        songParts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(StructurePartTableViewCell.self)", for: indexPath)

        guard let cell = cell as? StructurePartTableViewCell else { return .init() }
        cell.accessoryType = .disclosureIndicator

        cell.didChanged = { structurePart in
            self.songParts[indexPath.row].structurePart = structurePart
        }

        return cell
    }

}

// MARK: - UITableViewDelegate

extension StructureTableViewCell: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        handleRowSelection(on: tableView, for: indexPath)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            handleStructurePartDeletion(on: tableView, for: indexPath)
        }
    }

}

// MARK: - Private Actions

@objc
private extension StructureTableViewCell {

    func addNewRow() {
        songParts.append(.init(structurePart: .intro))
        let indexPath = IndexPath(row: songParts.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }

}

// MARK: - Private Methods

private extension StructureTableViewCell {

    func handleRowSelection(on tableView: UITableView, for indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let cell = tableView.cellForRow(at: indexPath)

        guard
            let cell = cell as? StructurePartTableViewCell,
            let title = cell.title
        else { return }

        let vc = StructurePartDetailsViewController()
        vc.title = "\(title)"
        vc.song = song
        vc.rootNavigationController = rootNavigationController

        rootNavigationController?.present(vc, animated: true)
    }

    func handleStructurePartDeletion(on tableView: UITableView, for indexPath: IndexPath) {
        songParts.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }

}
