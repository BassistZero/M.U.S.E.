import UIKit

final class StructurePartProgressionTableViewCell: UITableViewCell {

    // MARK: - Private Outlets

    @IBOutlet private weak var progressionNameLabel: UILabel!
    @IBOutlet private weak var progressionLabel: UILabel!
    @IBOutlet private weak var progressionConfigurationView: ProgressionConfigurationView!

    // MARK: - Public Properties

    var songPart: SongPart?

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }

}

// MARK: - Configuration

private extension StructurePartProgressionTableViewCell {

    func configureAppearance() {
        progressionNameLabel.text = L10n.SongBuilder.Detail.Structure.Detail.StructurePartProgression.titleName

        progressionNameLabel.font = .preferredFont(forTextStyle: .title2)
        progressionNameLabel.textAlignment = .center

        progressionConfigurationView.didTapped = {
            self.updatePart()
        }

        guard let songPart, let noteValue = songPart.progression?.chords.first?.rootNote.value else { return }
        progressionConfigurationView.updateNoteValue(to: noteValue)


    }

    func updatePart() {
        guard let songPart, let noteValue = songPart.progression?.chords.first?.rootNote.value else { return }
        progressionConfigurationView.updateNoteValue(to: noteValue)
    }

}
