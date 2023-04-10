import UIKit

final class SetupTableViewCell: UITableViewCell, SongBuilderTableViewCell {

    // MARK: - Private Outlets

    @IBOutlet private weak var configurationView: ProgressionConfigurationView!

    // MARK: - SongBuilderTableViewCell

    var song: Song?
    var rootNavigationController: UINavigationController?

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

        configurationView.didTapped = {
            self.updateSong()
        }
    }

    func updateSong() {
        guard
            let progression = configurationView.progression,
            let chord = progression.chords.first,
            let key = Key(value: chord.rootNote.value, color: chord.type)
        else { return }

        song?.key = key
    }

}
