
struct Note {

    // MARK: - Public Properties

    var octave: Octave
    var value: NoteValue
    var absolete: Int { octave.rawValue * 12 + value.rawValue }

    // MARK: - Inits

    init(octave: Octave, value: NoteValue) {
        self.octave = octave
        self.value = value
    }

    /// Random Note
    init() {
        octave = Octave.allCases.randomElement()!
        value = NoteValue.allCases.randomElement()!
    }

    /// Random Value
    init(octave: Octave) {
        self.octave = octave
        value = NoteValue.allCases.randomElement()!
    }

    /// Random Octave
    init(value: NoteValue) {
        octave = Octave.allCases.randomElement()!
        self.value = value
    }

    // MARK: - Public Methods

    func interval(note: Note) -> Interval {
        let rawValue = abs(note.absolete - absolete)
        let interval = Interval.init(rawValue: rawValue % 12)!
        return interval
    }

}

// MARK: - Comparable

extension Note: Comparable {

    static func < (lhs: Note, rhs: Note) -> Bool {
        return lhs.absolete < rhs.absolete
    }

}

// MARK: - CustomStringConvertible

extension Note: CustomStringConvertible {

    var description: String {
        return String(octave.rawValue) + value.description
    }

}
