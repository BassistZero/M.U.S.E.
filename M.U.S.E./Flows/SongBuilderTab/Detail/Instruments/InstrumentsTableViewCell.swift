import UIKit

final class InstrumentsTableViewCell: UITableViewCell, SongBuilderTableViewCell {

    // MARK: - Private Outlets

    @IBOutlet private weak var instrumentsTableView: UITableView!
    @IBOutlet private weak var addInstrumentButton: UIButton!

    // MARK: - Private Properties

    private var instruments: [Instrument] = [] {
        didSet {
            song?.instruments = instruments
        }
    }

    // MARK: - SongBuilderTableViewCell

    var song: Song?
    var rootNavigationController: UINavigationController?

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }

}

// MARK: - Configuration

private extension InstrumentsTableViewCell {

    func setupInitialState() {
        setupTableView()
        setupButtons()
    }

    func setupTableView() {
        instrumentsTableView.dataSource = self
        instrumentsTableView.delegate = self

        instrumentsTableView.register(.init(nibName: "\(InstrumentTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(InstrumentTableViewCell.self)")
    }

    func setupButtons() {
        var configuration = UIButton.Configuration.filled()
        configuration.image = .init(systemName: "plus.circle.fill")
        configuration.imagePadding = 8
        configuration.cornerStyle = .large

        var attributedTitle = AttributedString(stringLiteral: L10n.SongBuilder.Detail.Instruments.addNewInstrument)
        attributedTitle.font = .systemFont(ofSize: 16)

        configuration.attributedTitle = attributedTitle

        addInstrumentButton.configuration = configuration

        addInstrumentButton.addTarget(self, action: #selector(addNewInstrument), for: .touchUpInside)
    }

}

// MARK: - UITableViewDataSource

extension InstrumentsTableViewCell: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        instruments.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(InstrumentTableViewCell.self)", for: indexPath)

        guard let cell = cell as? InstrumentTableViewCell else { return .init() }

        cell.name = instruments[indexPath.row].description

        return cell
    }

}

// MARK: - UITableViewDelegate

extension InstrumentsTableViewCell: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        handleRowSelection(on: tableView, for: indexPath)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            handleInstrumentDeletion(on: tableView, for: indexPath)
        }
    }

}

// MARK: - Private Actions

@objc
private extension InstrumentsTableViewCell {

    func addNewInstrument() {
        let alertController = UIAlertController(title: L10n.SongBuilder.Detail.Instruments.AddingAlert.title, message: nil, preferredStyle: .actionSheet)

        for instrument in Instrument.allCases {
            let addInstrumentAction = UIAlertAction(title: instrument.description, style: .default) { _ in
                self.instruments += [instrument]
                let indexPath = IndexPath(row: self.instruments.count - 1, section: 0)
                self.instrumentsTableView.insertRows(at: [indexPath], with: .automatic)
            }
            alertController.addAction(addInstrumentAction)
        }

        let cancelAction = UIAlertAction(title: L10n.SongBuilder.Detail.Instruments.AddingAlert.cancel, style: .cancel) { _ in
            return
        }

        alertController.addAction(cancelAction)

        rootNavigationController?.present(alertController, animated: true)
    }

}

// MARK: - Private Methods

private extension InstrumentsTableViewCell {

    func handleRowSelection(on tableView: UITableView, for indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let cell = tableView.cellForRow(at: indexPath)

        guard
            let cell = cell as? InstrumentTableViewCell,
            let title = cell.name
        else { return }

        let vc = UIViewController()
        vc.view.backgroundColor = .init(named: "systemWhite")
        vc.title = title

        rootNavigationController?.pushViewController(vc, animated: true)
    }

    func handleInstrumentDeletion(on tableView: UITableView, for indexPath: IndexPath) {
        instruments.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }

}
