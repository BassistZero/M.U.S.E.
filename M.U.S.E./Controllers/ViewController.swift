
import UIKit

final class ViewController: UIViewController {

    // MARK: - Private Outlets

    @IBOutlet private weak var chordLabel: UILabel!
    @IBOutlet private weak var valuePickerView: UIPickerView!
    @IBOutlet private weak var octavePickerView: UIPickerView!
    @IBOutlet weak var sortChordButton: UIButton!
    
    // MARK: - Private Properties

    private var chord: Chord? { didSet { sortChordButton.isHidden = chord!.notes == chord!.sortedNotes! }}

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        generateChord()
        chord!.notes = chord!.sortedNotes!
        updateUI()
        configurePickerView()
    }

}

// MARK: - UIPickerViewDataSource

extension ViewController: UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == valuePickerView {
            return NoteValue.allCases.count
        }

        if pickerView == octavePickerView {
            return Octave.allCases.count
        }

        return 0
    }

}

// MARK: - UIPickerViewDelegate

extension ViewController: UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == valuePickerView {
            return Note(value: .init(rawValue: row)!).value.description
        }

        if pickerView == octavePickerView {
            return Octave(rawValue: row)!.rawValue.description
        }

        return "error"
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == valuePickerView {
            chord?.updateValue(of: component, with: .init(rawValue: row)!)
        }

        if pickerView == octavePickerView {
            chord?.updateOctave(of: component, with: .init(rawValue: row)!)
        }

        updateUI()
    }

}

// MARK: - Private Actions

private extension ViewController {

    @IBAction func updateChord(_ sender: UIButton) {
        generateChord()
        chord!.notes = chord!.sortedNotes!
        updateUI()
        selectAllPickerViewRows()
    }

    @IBAction func sortChord(_ sender: UIButton) {
        chord!.notes = chord!.sortedNotes!
        updateUI()
        selectAllPickerViewRows()
    }

}

// MARK: - Configuration

private extension ViewController {

    func configurePickerView() {
        valuePickerView.dataSource = self
        valuePickerView.delegate = self

        octavePickerView.dataSource = self
        octavePickerView.delegate = self

        selectAllPickerViewRows()
    }

}

// MARK: - Private Methods

private extension ViewController {

    func generateChord() {
        var notes = [Note]()

        for _ in 1...3 {
            let note = Note()
            notes.append(note)
        }

        chord = Chord(notes: notes)
    }

    func updateUI() {
        if chord!.notes == chord!.sortedNotes! {
            chordLabel.text = "Intervals: \(chord!.intervals!)\nChord: \(chord!.rootNote!.value)\(chord!.type!)"
        } else {
            chordLabel.text = "Root Note: \(chord!.rootNote!)\n Intervals: \(chord!.intervals!)\nChord: \(chord!.rootNote!.value)\(chord!.type!)"
        }
    }

    func selectAllPickerViewRows() {
        valuePickerView.selectRow(chord!.notes[0].value.rawValue, inComponent: 0, animated: true)
        valuePickerView.selectRow(chord!.notes[1].value.rawValue, inComponent: 1, animated: true)
        valuePickerView.selectRow(chord!.notes[2].value.rawValue, inComponent: 2, animated: true)

        octavePickerView.selectRow(chord!.notes[0].octave.rawValue, inComponent: 0, animated: true)
        octavePickerView.selectRow(chord!.notes[1].octave.rawValue, inComponent: 1, animated: true)
        octavePickerView.selectRow(chord!.notes[2].octave.rawValue, inComponent: 2, animated: true)
    }
    
}
