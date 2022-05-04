//
//  Chord.swift
//  M.U.S.E.
//
//  Created by Bassist_Zero on 4/26/22.
//

struct Chord {

    // MARK: - Public Properties

    var notes: [Note] {
        didSet {
            updateNotes()
        }
    }
    var rootNote: Note?
    var intervals = [Interval]()
    var type = ChordType.NaN

    // MARK: - Private Properties

    var sortedNotes = [Note]()

    // MARK: - Inits

    init(notes: [Note]) {
        self.notes = notes
    }

}

// MARK: - Public Methods

extension Chord {

    mutating func updateValue(of note: Int, with value: Note.NoteValue) {
        notes[note].value = value
    }

    mutating func updateOctave(of note: Int, with octave: Octave) {
        notes[note].octave = octave
    }

}

// MARK: - Private Methods

private extension Chord {

    mutating func updateNotes() {
        sortedNotes = notes.sorted(by: <)
        rootNote = sortedNotes[0]

        var intervals = [Interval]()

        for i in 1...sortedNotes.count - 1 {
            intervals.append(self.sortedNotes[0].interval(note: self.sortedNotes[i]))
        }

        self.intervals = intervals.sorted(by: <)

        updateType()
    }

}
