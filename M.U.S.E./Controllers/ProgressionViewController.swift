import UIKit

final class ProgressionViewController: UIViewController {

    // MARK: - Private Outlets

    @IBOutlet private weak var notePickerView: NotePickerView!
    @IBOutlet private weak var progressionType: UISegmentedControl!
    @IBOutlet private weak var progressionTypeColor: UISegmentedControl!
    @IBOutlet private weak var progressionVersion: UISegmentedControl!
    @IBOutlet private weak var ProgressionTextView: UITextView!
    @IBOutlet private weak var polyphonySwitch: UISwitch!

    // MARK: - Private Properties

    private var progression: Progression?
    private var progressionPlayer: ProgressionPlayer?

}

// MARK: - UIViewController

extension ProgressionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupInitialState()
    }

}

// MARK: - IBActions

extension ProgressionViewController {

    @IBAction func GenerateProgression(_ sender: UIButton) {
        configureProgressionView()
    }

    @IBAction func playProgression(_ sender: UIButton) {
        playProgression()
    }

}

// MARK: - Configuration

private extension ProgressionViewController {

    func setupInitialState() {
        configureProgressionView()
        configureProgressionPlayer()
        playProgression()
    }

    func configureProgressionView() {
        let type = configureType()
        let version = configureVersion()
        let keyNote = configureKeyNote()

        progression = Progression(root: keyNote, type: type, version: version)
        ProgressionTextView.text = progression?.description
    }

    func configureKeyNote() -> Note {
        let value = notePickerView.selectedNoteValue
        let octave = notePickerView.selectedOctave

        let keyNote = Note(octave: octave, value: value)

        return keyNote
    }

    func configureVersion() -> ProgressionVersion {
        switch progressionVersion.selectedSegmentIndex {
        case 0:
            return .oneThreeFourFive
        case 1:
            return .oneTwoThreeFour
        case 2:
            return .oneSixFourFive
        case 3:
            return .random
        default:
            return .random
        }
    }

    //swiftlint:disable cyclomatic_complexity
    func configureType() -> ScaleType {
        switch progressionType.selectedSegmentIndex {
        case 0:
            switch progressionTypeColor.selectedSegmentIndex {
            case 0:
                return .minorNatural
            case 1:
                return .minorHarmonic
            case 2:
                return .minorMelodic
            default:
                break
            }

        case 1:
            switch progressionTypeColor.selectedSegmentIndex {
            case 0:
                return .majorNatural
            case 1:
                return .majorHarmonic
            case 2:
                return .majorMelodic
            default:
                break
            }

        default:
            break
        }

        return .minorNatural
    }

    func configureProgressionPlayer() {
        progressionPlayer = ProgressionPlayer()
    }

}

// MARK: - Private Methods

private extension ProgressionViewController {

    func playProgression() {
        polyphonySwitch.isOn ? playProgressionWithPolyphony() : playProgressionWithoutPolyphony()
    }

    func playProgressionWithoutPolyphony() {
        if let progression = progression {
            progressionPlayer?.play(progression: progression, isPolyphony: false)
        }
    }

    func playProgressionWithPolyphony() {
        if let progression = progression {
            progressionPlayer?.play(progression: progression)
        }
    }

}
