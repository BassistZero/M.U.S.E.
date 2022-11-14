struct Progression {

    var chords: [Chord] {
        getChords()
    }

    let root: Note
    let scale: Scale
    let version: ProgressionVersion

    init(root: Note, type: ScaleType, version: ProgressionVersion) {
        self.root = root
        self.version = version
        scale = Scale(root: root, type: type)
    }

}

// MARK: - Private Methods

private extension Progression {

    // swiftlint:disable line_length
    func getChords() -> [Chord] {

        switch version {
        case .oneTwoThreeFour:
            return configureChords(first: .one, second: .two, third: .three, fourth: .four)
        case .oneSixFourFive:
            return configureChords(first: .one, second: .six, third: .four, fourth: .five)
        case .oneThreeFourFive:
            return configureChords(first: .one, second: .three, third: .four, fourth: .five)
        case .random:
            return configureChords(first: .allCases.randomElement() ?? .one, second: .allCases.randomElement() ?? .one, third: .allCases.randomElement() ?? .one, fourth: .allCases.randomElement() ?? .one)
        }
    }
    // swiftlint:enable line_length

    func configureChords(first: ScaleStep, second: ScaleStep, third: ScaleStep, fourth: ScaleStep) -> [Chord] {
        let chord1 = getSimpleChord(from: first)
        let chord2 = getSimpleChord(from: second)
        let chord3 = getSimpleChord(from: third)
        let chord4 = getSimpleChord(from: fourth)

        let chords = [chord1, chord2, chord3, chord4]

        return chords
    }

    func getSimpleChord(from step: ScaleStep) -> Chord {
        let note1 = scale.notes[step.rawValue]
        let note2 = scale.notes[step.rawValue + 2]
        let note3 = scale.notes[step.rawValue + 4]

        let notes = [note1, note2, note3]

        let chord = Chord(notes: notes)
        return chord
    }

}

// MARK: - CustomStringConvertible

extension Progression: CustomStringConvertible {

    var description: String {
        return chords.description
    }

}
