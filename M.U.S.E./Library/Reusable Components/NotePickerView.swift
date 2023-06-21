import UIKit

@IBDesignable
final class NotePickerView: UIView {

    // MARK: - Private Outlets

    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var cFNotes: UISegmentedControl!
    @IBOutlet private weak var fSharpBNotes: UISegmentedControl!
    @IBOutlet private weak var octavePicker: UISegmentedControl!

    // MARK: - Public Events

    var didTapped: (() -> Void)?

    // MARK: - Public Properties

    var selectedNoteValue: NoteValue = .c
    var selectedOctave: Octave = .four

    // MARK: - UIView

    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
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

        if sender === octavePicker {
            selectedOctave = .init(rawValue: octavePicker.selectedSegmentIndex) ?? .four
        }
    }

}

// MARK: - Configuration

private extension NotePickerView {

    func setupInitialState() {
        configureAppearance()
        configureTitles()

        cFNotes.addTarget(self, action: #selector(updateNote), for: .valueChanged)
        fSharpBNotes.addTarget(self, action: #selector(updateNote), for: .valueChanged)
        octavePicker.addTarget(self, action: #selector(updateNote), for: .valueChanged)
    }

    func configureAppearance() {
        cFNotes.selectedSegmentIndex = 0
        fSharpBNotes.selectedSegmentIndex = UISegmentedControl.noSegment
        octavePicker.selectedSegmentIndex = 4
    }

    func configureTitles() {
        cFNotes.setTitle(NoteValue.c.description, forSegmentAt: Self.c)
        cFNotes.setTitle(NoteValue.cSharp.description, forSegmentAt: Self.cSharp)
        cFNotes.setTitle(NoteValue.d.description, forSegmentAt: Self.d)
        cFNotes.setTitle(NoteValue.dSharp.description, forSegmentAt: Self.dSharp)
        cFNotes.setTitle(NoteValue.e.description, forSegmentAt: Self.e)
        cFNotes.setTitle(NoteValue.f.description, forSegmentAt: Self.f)

        fSharpBNotes.setTitle(NoteValue.fSharp.description, forSegmentAt: Self.fSharp)
        fSharpBNotes.setTitle(NoteValue.g.description, forSegmentAt: Self.g)
        fSharpBNotes.setTitle(NoteValue.gSharp.description, forSegmentAt: Self.gSharp)
        fSharpBNotes.setTitle(NoteValue.a.description, forSegmentAt: Self.a)
        fSharpBNotes.setTitle(NoteValue.aSharp.description, forSegmentAt: Self.aSharp)
        fSharpBNotes.setTitle(NoteValue.b.description, forSegmentAt: Self.b)
    }

    func commonInit() {
        let bundle = Bundle(for: NotePickerView.self)
        let nib = UINib(nibName: "\(NotePickerView.self)", bundle: bundle)
        nib.instantiate(withOwner: self)

        addSubview(contentView)
        contentView.frame = bounds
    }

}

// MARK: - Public Methods

extension NotePickerView {

    func updateTopSection(with noteValue: NoteValue) {
        cFNotes.selectedSegmentIndex = noteValue.rawValue
        fSharpBNotes.selectedSegmentIndex = UISegmentedControl.noSegment
    }

    func updateBottomSection(with noteValue: NoteValue) {
        fSharpBNotes.selectedSegmentIndex = noteValue.rawValue
        cFNotes.selectedSegmentIndex = UISegmentedControl.noSegment
    }

}

// MARK: - Private Actions

@objc
private extension NotePickerView {

    func updateNote() {
        didTapped?()
    }

}

// MARK: - Indices

private extension NotePickerView {

    static let c = 0
    static let cSharp = 1
    static let d = 2
    static let dSharp = 3
    static let e = 4
    static let f = 5

    static let fSharp = 0
    static let g = 1
    static let gSharp = 2
    static let a = 3
    static let aSharp = 4
    static let b = 5

}
