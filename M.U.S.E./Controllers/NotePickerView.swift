import UIKit

@IBDesignable
class NotePickerView: UIView {

    // MARK: - Private Outlets

    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var cFNotes: UISegmentedControl!
    @IBOutlet private weak var fSharpBNotes: UISegmentedControl!

    // MARK: - Public Properties

    var selectedNoteValue: NoteValue = .c

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

    // MARK: - Private Properties

    private let cFNotesDict: [Int: NoteValue] = [
        0: .c,
        1: .cSharp,
        2: .d,
        3: .dSharp,
        4: .e,
        5: .f
    ]

    private let fSharpBDict: [Int: NoteValue] = [
        0: .fSharp,
        1: .g,
        2: .gSharp,
        3: .a,
        4: .aSharp,
        5: .b
    ]

    // MARK: - Actions

    @IBAction func segmentTapped(_ sender: UISegmentedControl) {
        if sender === cFNotes {
            fSharpBNotes.selectedSegmentIndex = UISegmentedControl.noSegment
            selectedNoteValue = cFNotesDict[cFNotes.selectedSegmentIndex] ?? .c
        }

        if sender === fSharpBNotes {
            cFNotes.selectedSegmentIndex = UISegmentedControl.noSegment
            selectedNoteValue = fSharpBDict[fSharpBNotes.selectedSegmentIndex] ?? .f
        }
    }

    // MARK: - Configuration

    private func configureAppearance() {
        cFNotes.selectedSegmentIndex = 0
        fSharpBNotes.selectedSegmentIndex = UISegmentedControl.noSegment
    }

    private func commonInit() {
        let bundle = Bundle(for: NotePickerView.self)
        let nib = UINib(nibName: "\(NotePickerView.self)", bundle: bundle)
        nib.instantiate(withOwner: self)

        addSubview(contentView)
        contentView.frame = bounds
    }

}
