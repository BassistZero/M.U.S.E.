import UIKit

final class ChordViewController: UIViewController {

    // MARK: - Private Outlets

    @IBOutlet private weak var chordLabel: UILabel!
    @IBOutlet private weak var valuePickerView: UIPickerView!
    @IBOutlet private weak var octavePickerView: UIPickerView!
    @IBOutlet private weak var updateChordButton: UIButton!
    @IBOutlet private weak var sortChordButton: UIButton!
    @IBOutlet private weak var isPolyphonyLabel: UILabel!
    @IBOutlet private weak var polyphonySwitch: UISwitch!
    @IBOutlet private weak var playChordButton: UIButton!

    // MARK: - Private Properties

    private var chordPlayer = ChordPlayer()
    private var chord = Chord() {
        didSet {
            sortChordButton.isHidden = chord.notes == chord.sortedNotes
        }
    }

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
    }

}

// MARK: - UIPickerViewDataSource

extension ChordViewController: UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        3
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case valuePickerView: return NoteValue.allCases.count
        case octavePickerView: return Octave.allCases.count
        default: return 0
        }
    }

}

// MARK: - UIPickerViewDelegate

extension ChordViewController: UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case valuePickerView: return Note(value: .init(rawValue: row) ?? .c).value.description
        case octavePickerView: return Octave(rawValue: row)?.rawValue.description
        default: return "error"
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == valuePickerView {
            chord.updateValue(of: component, with: .init(rawValue: row) ?? .c)
        }

        if pickerView == octavePickerView {
            chord.updateOctave(of: component, with: .init(rawValue: row) ?? .zero)
        }

        updateUI()
    }

}

// MARK: - Private Actions

private extension ChordViewController {

    @IBAction func updateChord(_ sender: UIButton) {
        generateChord()
        chord.notes = chord.sortedNotes
        updateUI()
        selectAllPickerViewRows()
        playChord()
    }

    @IBAction func sortChord(_ sender: UIButton) {
        chord.notes = chord.sortedNotes
        updateUI()
        selectAllPickerViewRows()
    }

    @IBAction func playChordPressed(_ sender: UIButton) {
        playChord()
    }

}

// MARK: - Configuration

private extension ChordViewController {

    func setupInitialState() {
        configurePickerView()
        configureButtons()
        chord.notes = chord.sortedNotes
        configureLabels()
    }

    func configurePickerView() {
        valuePickerView.dataSource = self
        valuePickerView.delegate = self

        octavePickerView.dataSource = self
        octavePickerView.delegate = self

        selectAllPickerViewRows()
    }

    func configureButtons() {
        updateChordButton.setTitle(L10n.ChordViewController.Buttons.update, for: .normal)
        sortChordButton.setTitle(L10n.ChordViewController.Buttons.sort, for: .normal)
        playChordButton.setTitle(L10n.ChordViewController.Buttons.playChord, for: .normal)

    }

    func configureLabels() {
        isPolyphonyLabel.text = L10n.ChordViewController.Switch.text
        updateUI()
    }

}

// MARK: - Private Methods

private extension ChordViewController {

    func generateChord() {
        chord = Chord()
    }

    func updateUI() {
        if chord.notes == chord.sortedNotes {
            chordLabel.text = "\(L10n.ChordViewController.Text.intervals): \(chord.intervals)\n\(L10n.ChordViewController.Text.chord): \(chord.rootNote.value)\(chord.type)"
        } else {
            chordLabel.text = "\(L10n.ChordViewController.Text.rootNote): \(chord.rootNote)\n \(L10n.ChordViewController.Text.intervals): \(chord.intervals)\n\(L10n.ChordViewController.Text.chord): \(chord.rootNote.value)\(chord.type)"
        }
    }

    func selectAllPickerViewRows() {
        valuePickerView.selectRow(chord.notes[0].value.rawValue, inComponent: 0, animated: true)
        valuePickerView.selectRow(chord.notes[1].value.rawValue, inComponent: 1, animated: true)
        valuePickerView.selectRow(chord.notes[2].value.rawValue, inComponent: 2, animated: true)

        octavePickerView.selectRow(chord.notes[0].octave.rawValue, inComponent: 0, animated: true)
        octavePickerView.selectRow(chord.notes[1].octave.rawValue, inComponent: 1, animated: true)
        octavePickerView.selectRow(chord.notes[2].octave.rawValue, inComponent: 2, animated: true)
    }

    func playChord() {
        let delay = 0.5

        if polyphonySwitch.isOn {
            self.chordPlayer.play(chord: self.chord)
        } else {
            self.chordPlayer.play(chord: self.chord, delay: delay)
        }
    }

}
