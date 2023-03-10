struct Scale {
    var notes: [Note] {
        getNotes()
    }

    let root: Note
    let type: ScaleType

    init(root: Note, type: ScaleType) {
        self.root = root
        self.type = type
    }
}

// MARK: - Private Methods

private extension Scale {

    func getNotes() -> [Note] {
        switch type {
        case .minorNatural:
            return getMinorNaturalNotes()
        case .minorHarmonic:
            return getMinorHarmonicNotes()
        case .minorMelodic:
            return getMinorMelodicNotes()

        case .majorNatural:
            return getMajorNaturalNotes()
        case .majorHarmonic:
            return getMajorHarmonicNotes()
        case .majorMelodic:
            return getMajorMelodicNotes()
        }
    }

    func getMinorNaturalNotes() -> [Note] {
        var notes = [root]

        for i in 0...9 {
            let offset: Int

            switch i {
            case 1, 4, 8:
                offset = 1
            default:
                offset = 2
            }

            let note = Note(absolute: notes[i].absolute + offset)

            notes.append(note)
        }

        return notes
    }

    func getMinorHarmonicNotes() -> [Note] {
        var notes = [root]

        for i in 0...9 {
            let offset: Int

            switch i {
            case 1, 4, 6, 8:
                offset = 1
            case 5:
                offset = 3
            default:
                offset = 2
            }

            let note = Note(absolute: notes[i].absolute + offset)

            notes.append(note)
        }

        return notes
    }

    func getMinorMelodicNotes() -> [Note] {
        var notes = [root]

        for i in 0...9 {
            let offset: Int

            switch i {
            case 1, 6, 8:
                offset = 1
            default:
                offset = 2
            }

            let note = Note(absolute: notes[i].absolute + offset)

            notes.append(note)
        }

        return notes
    }

    func getMajorNaturalNotes() -> [Note] {
        var notes = [root]

        for i in 0...9 {
            let offset: Int

            switch i {
            case 2, 6, 9:
                offset = 1
            default:
                offset = 2
            }

            let note = Note(absolute: notes[i].absolute + offset)

            notes.append(note)
        }

        return notes
    }

    func getMajorHarmonicNotes() -> [Note] {
        var notes = [root]

        for i in 0...9 {
            let offset: Int

            switch i {
            case 2, 5, 9:
                offset = 1
            default:
                offset = 2
            }

            let note = Note(absolute: notes[i].absolute + offset)

            notes.append(note)
        }

        return notes
    }

    func getMajorMelodicNotes() -> [Note] {
        var notes = [root]

        for i in 0...9 {
            let offset: Int

            switch i {
            case 2, 4, 9:
                offset = 1
            default:
                offset = 2
            }

            let note = Note(absolute: notes[i].absolute + offset)

            notes.append(note)
        }

        return notes
    }

}

// MARK: - CustomStringConvertible

extension Scale: CustomStringConvertible {

    var description: String {
        return notes.description
    }

}
