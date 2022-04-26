//
//  ViewController.swift
//  M.U.S.E.
//
//  Created by Bassist_Zero on 4/23/22.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var chordLabel: UILabel!
    @IBOutlet weak var chordPickerView: UIPickerView!
    
    var chord: Chord?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        generateChord()
        updateUI()

        chordPickerView.dataSource = self
        chordPickerView.delegate = self

        chordPickerView.selectRow(chord!.notes[0].value.rawValue, inComponent: 0, animated: true)
        chordPickerView.selectRow(chord!.notes[1].value.rawValue, inComponent: 1, animated: true)
        chordPickerView.selectRow(chord!.notes[2].value.rawValue, inComponent: 2, animated: true)
    }

}

// MARK: - UIPickerViewDataSource

extension ViewController: UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        Note.NoteValue.allCases.count
    }

}

// MARK: - UIPickerViewDelegate

extension ViewController: UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Note(value: .init(rawValue: row)!).value.description
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        chord?.notes[component] = Note(octave: .one, value: .init(rawValue: row)!)
        updateUI()
    }

}

// MARK: - Private Actions

private extension ViewController {

    @IBAction func updateChord(_ sender: UIButton) {
        generateChord()
        updateUI()

        chordPickerView.selectRow(chord!.notes[0].value.rawValue, inComponent: 0, animated: true)
        chordPickerView.selectRow(chord!.notes[1].value.rawValue, inComponent: 1, animated: true)
        chordPickerView.selectRow(chord!.notes[2].value.rawValue, inComponent: 2, animated: true)
    }

}

// MARK: - Private Methods

private extension ViewController {

    func generateChord() {
        var notes = [Note]()

        for _ in 1...3 {
            let note = Note(octave: .one)
            notes.append(note)
        }

        chord = Chord(notes: notes)
    }

    func updateUI() {
        chordLabel.text = "Intervals: \(chord!.intervals)\nChord Type: \(chord!.type)"
    }
    
}
