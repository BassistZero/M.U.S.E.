import UIKit

final class InstrumentTableViewCell: UITableViewCell {

    // MARK: - Private Outlets

    @IBOutlet private weak var instrumentNameLabel: UILabel!
    @IBOutlet private weak var partsNameLabel: UILabel!
    @IBOutlet private weak var partsLabel: UILabel!

    // MARK: - Public Properties

    var name: String? {
        didSet {
            instrumentNameLabel.text = name
        }
    }

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }

}

// MARK: - Configuration

private extension InstrumentTableViewCell {

    func setupInitialState() {
        instrumentNameLabel.font = .boldSystemFont(ofSize: 16)

        partsNameLabel.text = "\(L10n.SongBuilder.Detail.Instruments.partsName):"
        partsNameLabel.font = .systemFont(ofSize: 16)

        partsLabel.text = L10n.SongBuilder.Detail.Instruments.emptyParts
        partsLabel.font = .systemFont(ofSize: 16)
    }

}
