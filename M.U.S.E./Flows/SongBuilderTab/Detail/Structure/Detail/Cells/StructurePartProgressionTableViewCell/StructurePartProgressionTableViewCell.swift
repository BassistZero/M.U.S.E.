import UIKit

final class StructurePartProgressionTableViewCell: UITableViewCell {

    // MARK: - Private Outlets

    @IBOutlet private weak var progressionNameLabel: UILabel!
    @IBOutlet private weak var progressionLabel: UILabel!
    @IBOutlet private weak var configurationView: ProgressionConfigurationView!

    // MARK: - Public Events

    var handleProgressionUpdate: ((Progression) -> Void)?

    // MARK: - Public Properties

    var progression: Progression? {
        didSet {
            updatePart()
        }
    }

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

        configurationView.didTapped = {
            self.updatePart()
        }

        guard let noteValue = progression?.chords.first?.rootNote.value else { return }
        configurationView.updateNoteValue(to: noteValue)

        progression = configurationView.progression
        progressionLabel.text = progression?.description
    }

    func updatePart() {
        print(progression?.description ?? "Empty")

        guard let noteValue = progression?.chords.first?.rootNote.value else { return }
        configurationView.updateNoteValue(to: noteValue)

        progression = configurationView.progression
        print("Configuration view progression: \(configurationView.progression?.description ?? "none")")
        progressionLabel.text = progression?.description
    }

}
