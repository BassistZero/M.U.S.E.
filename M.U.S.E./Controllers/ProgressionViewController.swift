import UIKit

final class ProgressionViewController: UIViewController {

    // MARK: - Private Outlets

    @IBOutlet private weak var cFNotes: UISegmentedControl!
    @IBOutlet private weak var fSharpBNotes: UISegmentedControl!
    @IBOutlet private weak var octaveNote: UISegmentedControl!
    @IBOutlet private weak var progressionType: UISegmentedControl!
    @IBOutlet private weak var progressionTypeColor: UISegmentedControl!
    @IBOutlet private weak var progressionVersion: UISegmentedControl!

    @IBOutlet private weak var ProgressionTextView: UITextView!
    @IBOutlet private weak var polyphonySwitch: UISwitch!
    // MARK: - Private Properties

    private var keyNote: Note?
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

    @IBAction func noteValueChanged(_ sender: UISegmentedControl) {
        if sender === cFNotes {
            fSharpBNotes.selectedSegmentIndex = UISegmentedControl.noSegment
        } else if sender !== octaveNote {
            cFNotes.selectedSegmentIndex = UISegmentedControl.noSegment
        }

        var rawNoteValue: Int

        if sender === cFNotes {
            rawNoteValue = sender.selectedSegmentIndex
        } else if sender === fSharpBNotes {
            rawNoteValue = cFNotes.numberOfSegments + sender.selectedSegmentIndex
        } else {
            rawNoteValue = keyNote?.value.rawValue ?? 0
        }

        let octave = Octave(rawValue: octaveNote.selectedSegmentIndex) ?? .zero
        let value = NoteValue(rawValue: rawNoteValue) ?? .c

        keyNote = Note(octave: octave, value: value)
    }

    @IBAction func playProgression(_ sender: UIButton) {
        playProgression()
    }

}

// MARK: - Configuration

private extension ProgressionViewController {

    func setupInitialState() {
        configureNotesSegmentedControl()
        configureOctaveSegmentedControl()
        configureKeyNote()
        configureProgressionView()
        configureProgressionPlayer()
        playProgression()
    }

    func configureNotesSegmentedControl() {
        cFNotes.selectedSegmentIndex = 0
        fSharpBNotes.selectedSegmentIndex = UISegmentedControl.noSegment
    }

    func configureOctaveSegmentedControl() {
        octaveNote.selectedSegmentIndex = 4
    }

    func configureKeyNote() {
        let value = NoteValue(rawValue: cFNotes.selectedSegmentIndex) ?? .c
        let octave = Octave(rawValue: octaveNote.selectedSegmentIndex) ?? .zero

        keyNote = Note(octave: octave, value: value)
    }

    func configureProgressionView() {
        let type: ScaleType
        let version: ProgressionVersion

        type = configureType()
        version = configureVersion()

        if let keyNote = keyNote {
            progression = Progression(root: keyNote, type: type, version: version)
            ProgressionTextView.text = progression?.description
        }
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
            // minor
        case 0:
            switch progressionTypeColor.selectedSegmentIndex {
                // natural
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
                // natural
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
        polyphonySwitch.isOn ? playProgressionWithoutPolyphony() : playProgressionWithPolyphony()
    }

    func playProgressionWithPolyphony() {
        if let progression = progression {
            let notesDelay = 0.3
            progressionPlayer?.play(progression: progression, notesDelay: notesDelay)
        }
    }

    func playProgressionWithoutPolyphony() {
        if let progression = progression {
            progressionPlayer?.play(progression: progression)
        }
    }

}
