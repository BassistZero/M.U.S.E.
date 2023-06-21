import UIKit

final class SetupTableViewCell: UITableViewCell, SongBuilderPart {

    // MARK: - Private Outlets

    @IBOutlet private weak var configurationView: ProgressionConfigurationView!
    @IBOutlet private weak var tempoNameLabel: UILabel!
    @IBOutlet private weak var tempoLabel: UILabel!
    @IBOutlet private weak var tempoStepper: UIStepper!
    @IBOutlet private weak var sizeNameLabel: UILabel!
    @IBOutlet private weak var upTimeButton: UIButton!
    @IBOutlet private weak var downTimeButton: UIButton!

    // MARK: - SongBuilderTableViewCell

    var song: Song?
    var rootNavigationController: UINavigationController?

    // MARK: - Private Properties

    private var upTimeValue: Int = 0 {
        didSet {
            song?.time?.up = upTimeValue
        }
    }
    private var downTimeValue: BeatLength = .quarter {
        didSet {
            song?.time?.down = downTimeValue
        }
    }

    // MARK: - UIViewController

    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }

}

// MARK: - Configuration

private extension SetupTableViewCell {

    func setupInitialState() {
        configurationView.hideProgressionVersions()

        updateSong()

        configurationView.didTapped = {
            self.updateSong()
        }

        configureButtons()
        configureSteppers()
        configureLabels()
    }

    func configureButtons() {
        upTimeButton.showsMenuAsPrimaryAction = true

        var upActions: [UIAction] = []

        Array(2...15).forEach { up in
            upActions.append(.init(title: "\(up)", handler: { _ in
                self.upTimeButton.setTitle("\(up)", for: .normal)
                self.upTimeValue = up
            }))
        }

        let upMenu = UIMenu(children: upActions)

        upTimeButton.menu = upMenu

        let upValue = 4

        upTimeButton.setTitle("\(upValue)", for: .normal)
        upTimeValue = upValue

        downTimeButton.showsMenuAsPrimaryAction = true

        var downActions: [UIAction] = []

        [BeatLength.quarter, BeatLength.eighth, BeatLength.sixteenth].forEach { beatLength in
            downActions.append(.init(title: beatLength.description, handler: { _ in
                self.downTimeButton.setTitle(beatLength.description, for: .normal)
                self.downTimeValue = beatLength
            }))
        }

        let downMenu = UIMenu(children: downActions)

        downTimeButton.menu = downMenu

        let downValue = BeatLength.quarter

        downTimeButton.setTitle(downValue.description, for: .normal)
        downTimeValue = downValue
    }

    func configureLabels() {
        tempoNameLabel.text = L10n.SongBuilder.Detail.Configuration.tempoName
        tempoLabel.text = "\(Int(tempoStepper.value))"

        sizeNameLabel.text = L10n.SongBuilder.Detail.Configuration.timeName
    }

    func configureSteppers() {
        tempoStepper.value = 120
        tempoStepper.minimumValue = 40
        tempoStepper.maximumValue = 240
        tempoStepper.stepValue = 1

        tempoStepper.addTarget(self, action: #selector(updateTempo), for: .valueChanged)
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

// MARK: - Private Actions

@objc
private extension SetupTableViewCell {

    func updateTempo() {
        let newTempo = Int(tempoStepper.value)
        tempoLabel.text = "\(newTempo)"
        song?.tempo = newTempo
    }

}
