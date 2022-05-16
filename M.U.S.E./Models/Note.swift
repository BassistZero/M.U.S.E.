struct Note {

    // MARK: - Public Properties

    var octave: Octave
    var value: NoteValue
    var absolete: Int { octave.rawValue * Interval.allCases.count + value.rawValue }

    // MARK: - Inits

    init(octave: Octave, value: NoteValue) {
        self.octave = octave
        self.value = value
    }

    /// Random Note
    init() {
        octave = Octave.allCases.randomElement() ?? .zero
        value = NoteValue.allCases.randomElement() ?? .c
    }

    /// Random Value
    init(octave: Octave) {
        self.octave = octave
        value = NoteValue.allCases.randomElement() ?? .c
    }

    /// Random Octave
    init(value: NoteValue) {
        octave = Octave.allCases.randomElement() ?? .zero
        self.value = value
    }

    // MARK: - Public Methods

    func interval(note: Note) -> Interval {
        let rawValue = abs(note.absolete - absolete)
        let interval = Interval(rawValue: rawValue % Interval.allCases.count) ?? .unison
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
