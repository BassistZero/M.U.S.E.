import UIKit

@IBDesignable
final class ProgressionConfigurationView: UIView {

    // MARK: - Private Outlets

    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var notePickerView: NotePickerView!
    @IBOutlet private weak var progressionType: UISegmentedControl!
    @IBOutlet private weak var progressionTypeColor: UISegmentedControl!
    @IBOutlet private weak var progressionVersion: UISegmentedControl!

    // MARK: - Public Events

    var didTapped: (() -> Void)?

    // MARK: - Public Properties

    var progression: Progression? {
        configureProgression()
    }

    // MARK: - UIView

    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

}

// MARK: - Configuration

private extension ProgressionConfigurationView {

    func configureAppearance() {
        configureEvents()
        configureProgressionTypeText()
        configureProgressionTypeColorText()
        configureProgressionVersionText()

    }

    func configureEvents() {
        notePickerView.didTapped = didTapped
        progressionType.addTarget(self, action: #selector(updateSong), for: .valueChanged)
    }

    func configureProgressionTypeText() {
        progressionType.setTitle(L10n.ProgressionType.minor, forSegmentAt: 0)
        progressionType.setTitle(L10n.ProgressionType.major, forSegmentAt: 1)
    }

    func configureProgressionTypeColorText() {
        progressionTypeColor.setTitle(L10n.ProgressionTypeColor.natural, forSegmentAt: 0)
        progressionTypeColor.setTitle(L10n.ProgressionTypeColor.harmonic, forSegmentAt: 1)
        progressionTypeColor.setTitle(L10n.ProgressionTypeColor.melodic, forSegmentAt: 2)
    }

    func configureProgressionVersionText() {
        progressionVersion.setTitle(L10n.ProgressionVersion.oneThreeFourFive, forSegmentAt: 0)
        progressionVersion.setTitle(L10n.ProgressionVersion.oneTwoThreeFour, forSegmentAt: 1)
        progressionVersion.setTitle(L10n.ProgressionVersion.oneSixFourFive, forSegmentAt: 2)
        progressionVersion.setTitle(L10n.ProgressionVersion.oneFiveFourOne, forSegmentAt: 3)
        progressionVersion.setTitle(L10n.ProgressionVersion.random, forSegmentAt: 4)
    }

    func configureProgression() -> Progression {
        let keyNote = configureKeyNote()
        let type = configureType()
        let version = configureVersion()

        return Progression(root: keyNote, type: type, version: version)
    }

    func configureKeyNote() -> Note {
        let value = notePickerView.selectedNoteValue
        let octave = notePickerView.selectedOctave

        let keyNote = Note(octave: octave, value: value)

        return keyNote
    }

    func configureVersion() -> ProgressionVersion {
        switch progressionVersion.selectedSegmentIndex {
        case 0: return .oneThreeFourFive
        case 1: return .oneTwoThreeFour
        case 2: return .oneSixFourFive
        case 3: return .oneFiveFourOne
        case 4: return .random
        default: return .random
        }
    }

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

    private func commonInit() {
        let bundle = Bundle(for: ProgressionConfigurationView.self)
        let nib = UINib(nibName: "\(ProgressionConfigurationView.self)", bundle: bundle)
        nib.instantiate(withOwner: self)

        addSubview(contentView)
        contentView.frame = bounds
    }

}

// MARK: - Public Methods

extension ProgressionConfigurationView {

    func updateNoteValue(to noteValue: NoteValue) {
        if noteValue.rawValue <= 5 {
            notePickerView.updateTopSection(with: noteValue)
        } else {
            notePickerView.updateBottomSection(with: noteValue)
        }
    }

    func hideProgressionVersions() {
        progressionVersion.isHidden = true
    }

}

// MARK: - Private Actions

@objc
private extension ProgressionConfigurationView {

    func updateSong() {
        didTapped?()
    }

}
