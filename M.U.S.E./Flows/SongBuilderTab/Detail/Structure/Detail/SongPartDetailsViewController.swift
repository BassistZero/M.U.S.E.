import UIKit

final class SongPartDetailsViewController: UIViewController, SongBuilderPart {

    // MARK: - Private Outlets

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var addInstrumentButton: UIButton!

    // MARK: - SongBuilderTableViewCell

    var song: Song?
    var rootNavigationController: UINavigationController?

    // MARK: - Public Properties

    var songPart: SongPart?

    // MARK: - Public Events

    var handleAddingInstrument: ((Instrument) -> Void)?
    var handleProgressionUpdate: ((Progression) -> Void)?

    // MARK: - UIViewController

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupInitialState()
    }

}

// MARK: - Configuration

private extension SongPartDetailsViewController {

    func setupInitialState() {
        setupTitle()
        setupTableView()
        setupButtons()
    }

    func setupTitle() {
        titleLabel.text = title

        titleLabel.textAlignment = .center
        titleLabel.font = .preferredFont(forTextStyle: .title1)
    }

    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(.init(nibName: "\(AssignedInstrumentsTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(AssignedInstrumentsTableViewCell.self)")
        tableView.register(.init(nibName: "\(StructurePartProgressionTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(StructurePartProgressionTableViewCell.self)")

        tableView.separatorStyle = .none
        tableView.allowsSelection = false
    }

    func setupButtons() {
        var configuration = UIButton.Configuration.filled()
        configuration.image = .init(systemName: "plus.circle.fill")
        configuration.imagePadding = 8
        configuration.cornerStyle = .large

        var attributedTitle = AttributedString(stringLiteral: L10n.SongBuilder.Detail.Structure.addNewInstrument)
        attributedTitle.font = .systemFont(ofSize: 16)

        configuration.attributedTitle = attributedTitle

        addInstrumentButton.configuration = configuration

        addInstrumentButton.addTarget(self, action: #selector(addNewInstrument), for: .touchUpInside)
    }

}

// MARK: - UITableViewDataSource

extension SongPartDetailsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0: return configureAssignedInstrumentsCell(on: tableView, for: indexPath)
        case 1: return configureStructurePartProgressionCell(on: tableView, for: indexPath)
        default: return .init()
        }
    }

}

// MARK: - UITableViewDelegate

extension SongPartDetailsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return view.frame.height * 0.25
        }

        return UITableView.automaticDimension
    }

}

// MARK: - Private Actions

@objc
private extension SongPartDetailsViewController {

    func addNewInstrument() {
        let alertController = UIAlertController(title: L10n.SongBuilder.Detail.Structure.AddingAlert.title, message: nil, preferredStyle: .actionSheet)

        for instrument in Instrument.allCases {
            let addInstrumentAction = UIAlertAction(title: instrument.description, style: .default) { _ in
                self.handleAddingInstrument?(instrument)
            }
            alertController.addAction(addInstrumentAction)
        }

        let cancelAction = UIAlertAction(title: L10n.SongBuilder.Detail.Structure.AddingAlert.cancel, style: .cancel) { _ in
            return
        }

        alertController.addAction(cancelAction)

        present(alertController, animated: true)
    }

}

// MARK: - Private Methods

private extension SongPartDetailsViewController {

    func configureAssignedInstrumentsCell(on tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(AssignedInstrumentsTableViewCell.self)", for: indexPath)

        guard let cell = cell as? AssignedInstrumentsTableViewCell else { return .init() }

        handleAddingInstrument = cell.handleAddingInstrument
        cell.rootNavigationController = rootNavigationController

        return cell
    }

    func configureStructurePartProgressionCell(on tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(StructurePartProgressionTableViewCell.self)", for: indexPath)

        guard let cell = cell as? StructurePartProgressionTableViewCell else { return .init() }

        handleProgressionUpdate = cell.handleProgressionUpdate
        cell.progression = songPart?.progression

        return cell
    }

}
