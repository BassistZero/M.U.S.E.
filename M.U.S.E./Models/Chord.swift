struct Chord {

    // MARK: - Public Properties

    var notes: [Note]
    var rootNote: Note { return sortedNotes[0] }
    var intervals: [Interval] { return getIntervals() }
    var type: ChordType { return getChordType() }
    var sortedNotes: [Note] { return notes.sorted(by: <) }

}

// MARK: - Inits

extension Chord {

    /// Random Notes
    init() {
        self.notes = [Note(), Note(), Note()]
    }

}

// MARK: - Public Methods

extension Chord {

    mutating func updateValue(of note: Int, with value: NoteValue) {
        notes[note].value = value
    }

    mutating func updateOctave(of note: Int, with octave: Octave) {
        notes[note].octave = octave
    }

}

// MARK: - Private Methods

private extension Chord {

    func getIntervals() -> [Interval] {
        var intervals = [Interval]()

        for i in 1...sortedNotes.count - 1 {
            intervals.append(sortedNotes[0].interval(note: sortedNotes[i]))
        }

        return intervals.sorted(by: <)
    }

}

// MARK: - getChordType

private extension Chord {

    //swiftlint:disable cyclomatic_complexity
    func getChordType() -> ChordType {
        if intervals[0] == intervals[1] {
            let interval = [intervals[0]]

            switch interval {
            case[.unison]:
                return .major
            case [.minorSecond]:
                return .b9no3
            case [.majorSecond]:
                return .sus2
            case [.minorThird]:
                return .minor
            case [.majorThird]:
                return .major
            case [.fourth]:
                return .sus4
            case [.tritone]:
                return .b5no3
            case [.fifth]:
                return .five
            case [.minorSixth]:
                return .augNo3
            case [.majorSixth]:
                return .sixNo3
            case [.minorSeventh]:
                return .sevenNo3
            case [.majorSeventh]:
                return .maj7no3
            default:
                return .NaN
            }
        } else {
            switch intervals {
            case [.unison, .minorSecond]:
                return .b9no3
            case [.unison, .majorSecond]:
                return .sus2
            case [.unison, .minorThird]:
                return .minor
            case [.unison, .majorThird]:
                return .major
            case [.unison, .fourth]:
                return .sus4
            case [.unison, .tritone]:
                return .b5no3
            case [.unison, .fifth]:
                return .five
            case [.unison, .minorSixth]:
                return .augNo3
            case [.unison, .majorSixth]:
                return .sixNo3
            case [.unison, .minorSeventh]:
                return .sevenNo3
            case [.unison, .majorSeventh]:
                return .maj7no3

            case [.minorSecond, .majorSecond]:
                return .sus2b9
            case [.minorSecond, .minorThird]:
                return .mB9
            case [.minorSecond, .majorThird]:
                return .b9
            case [.minorSecond, .fourth]:
                return .sus4B9
            case [.minorSecond, .tritone]:
                return .b5b9no3
            case [.minorSecond, .fifth]:
                return .b9no3
            case [.minorSecond, .minorSixth]:
                return .b6b9no3
            case [.minorSecond, .majorSixth]:
                return .sixB9no3
            case [.minorSecond, .minorSeventh]:
                return .sevenB9no3
            case [.minorSecond, .majorSeventh]:
                return .maj7b9no3

            case [.majorSecond, .minorThird]:
                return .mAdd9
            case [.majorSecond, .majorThird]:
                return .add9
            case [.majorSecond, .fourth]:
                return .sus4Add9
            case [.majorSecond, .tritone]:
                return .sus2hash11
            case [.majorSecond, .fifth]:
                return .sus2
            case [.majorSecond, .minorSixth]:
                return .sus2b6
            case [.majorSecond, .majorSixth]:
                return .sixSus2
            case [.majorSecond, .minorSeventh]:
                return .sevenSus2
            case [.majorSecond, .majorSeventh]:
                return .maj7sus2

            case [.minorThird, .majorThird]:
                return .hash9
            case [.minorThird, .fourth]:
                return .mAdd11
            case [.minorThird, .tritone]:
                return .dim
            case [.minorThird, .fifth]:
                return .minor
            case [.minorThird, .minorSixth]:
                return .mB6
            case [.minorThird, .majorSixth]:
                return .m6
            case [.minorThird, .minorSeventh]:
                return .m7
            case [.minorThird, .majorSeventh]:
                return .mMaj7

            case [.majorThird, .fourth]:
                return .add11
            case [.majorThird, .tritone]:
                return .hash11
            case [.majorThird, .fifth]:
                return .major
            case [.majorThird, .minorSixth]:
                return .aug
            case [.majorThird, .majorSixth]:
                return .six
            case [.majorThird, .minorSeventh]:
                return .seven
            case [.majorThird, .majorSeventh]:
                return .maj7

            case [.fourth, .tritone]:
                return .sus4b5
            case [.fourth, .fifth]:
                return .sus4
            case [.fourth, .minorSixth]:
                return .sus4b6
            case [.fourth, .majorSixth]:
                return .sixSus4
            case [.fourth, .minorSeventh]:
                return .sevenSus4
            case [.fourth, .majorSeventh]:
                return .maj7sus4

            case [.tritone, .fifth]:
                return .b5no3
            case [.tritone, .minorSixth]:
                return .b5b6no3
            case [.tritone, .majorSixth]:
                return .sixB5no3
            case [.tritone, .minorSeventh]:
                return .sevenB5no3
            case [.tritone, .majorSeventh]:
                return .maj7hash11no3

            case [.fifth, .minorSixth]:
                return .b6no3
            case [.fifth, .majorSixth]:
                return .sixNo3
            case [.fifth, .minorSeventh]:
                return .sevenNo3
            case [.fifth, .majorSeventh]:
                return .maj7no3

            case [.minorSixth, .majorSixth]:
                return .dim6b13no5
            case [.minorSixth, .minorSeventh]:
                return .sevenB13no3
            case [.minorSixth, .majorSeventh]:
                return .maj7hash5no3

            case [.majorSixth, .minorSeventh]:
                return .thirteenNo3
            case [.majorSixth, .majorSeventh]:
                return .maj13no3

            case [.minorSeventh, .majorSeventh]:
                return .sevenMaj7no3

            default:
                return .NaN
            }
        }
    }
    //swiftlint:enable cyclomatic_complexity

}
