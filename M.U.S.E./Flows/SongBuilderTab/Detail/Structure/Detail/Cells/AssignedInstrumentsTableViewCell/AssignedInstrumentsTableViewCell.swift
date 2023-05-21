import UIKit

final class AssignedInstrumentsTableViewCell: UITableViewCell, SongBuilderPart {

    // MARK: - Private Outlets

    @IBOutlet private weak var instrumentsNameLabel: UILabel!
    @IBOutlet private weak var instrumentsTableView: UITableView!

    // MARK: - Public Events

    var handleAddingInstrument: ((Instrument) -> Void)?

    // MARK: - Public Properties

    var instrumentParts: [InstrumentPart] = [] {
        didSet {
            configureLabels()
        }
    }
    var progression: Progression?

    // MARK: - SongBuilderPart

    var song: Song?
    var rootNavigationController: UINavigationController?

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }

}

// MARK: - Configuration

private extension AssignedInstrumentsTableViewCell {

    func configureAppearance() {
        configureLabels()
        configureTableView()
        configureEvents()
    }

    func configureLabels() {
        instrumentsNameLabel.text = instrumentParts.isEmpty
        ? L10n.SongBuilder.Detail.Structure.Detail.AssignedInstruments.emptyInstruments
        : L10n.SongBuilder.Detail.Structure.Detail.AssignedInstruments.titleName

        instrumentsNameLabel.font = .preferredFont(forTextStyle: .title2)
        instrumentsNameLabel.textAlignment = .center
    }

    func configureTableView() {
        instrumentsTableView.dataSource = self
        instrumentsTableView.delegate = self

        instrumentsTableView.register(.init(nibName: "\(TitleTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(TitleTableViewCell.self)")
    }

    func configureEvents() {
        handleAddingInstrument = { instrument in
            self.instrumentParts.append(InstrumentPart(instrument: instrument))
            let indexPath = IndexPath(row: self.instrumentParts.count - 1, section: 0)
            self.instrumentsTableView.insertRows(at: [indexPath], with: .automatic)
        }
    }

}

// MARK: - UITableViewDataSource

extension AssignedInstrumentsTableViewCell: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        instrumentParts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(TitleTableViewCell.self)", for: indexPath)

        guard let cell = cell as? TitleTableViewCell else { return .init() }

        cell.title = instrumentParts[indexPath.row].instrument.description

        return cell
    }

}

// MARK: - UITableViewDelegate

extension AssignedInstrumentsTableViewCell: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let vc = InstrumentPartViewController()

        vc.instrumentPart = instrumentParts[indexPath.row]
        vc.progression

    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            handleInstrumentDeletion(on: tableView, for: indexPath)
        }
    }

}

// MARK: - Private Methods

private extension AssignedInstrumentsTableViewCell {

    func handleInstrumentDeletion(on tableView: UITableView, for indexPath: IndexPath) {
        instrumentParts.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }

}
