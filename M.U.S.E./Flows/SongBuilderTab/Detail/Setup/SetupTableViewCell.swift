import UIKit

final class SetupTableViewCell: UITableViewCell {

    // MARK: - Private Outlets

    @IBOutlet private weak var configurationView: ProgressionConfigurationView!

    // MARK: - UIViewController

    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }

}

// MARK: - Configuration

private extension SetupTableViewCell {

    func setupInitialState() {
        updateSong()
    }

    func updateSong() {

    }

}
