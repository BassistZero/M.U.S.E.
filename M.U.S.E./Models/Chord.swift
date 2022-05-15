
struct Chord {

    // MARK: - Public Properties

    var notes: [Note] { didSet { updateNotes() } }
    
    private(set) var rootNote: Note?
    private(set) var intervals: [Interval]?
    private(set) var type: ChordType?
    private(set) var sortedNotes: [Note]?

    // MARK: - Inits

    init(notes: [Note]) {
        self.notes = notes
        updateNotes()
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

    mutating func updateNotes() {
        self.sortedNotes = notes.sorted(by: <)
        guard let sortedNotes = self.sortedNotes else { return }

        rootNote = sortedNotes[0]

        var intervals = [Interval]()

        for i in 1...sortedNotes.count - 1 {
            intervals.append(sortedNotes[0].interval(note: sortedNotes[i]))
        }

        self.intervals = intervals.sorted(by: <)

        updateType()
    }

}

// MARK: - SetType

private extension Chord {

    mutating func updateType() {
        if intervals![0] == intervals![1] {
            intervals = [intervals![0]]

            switch intervals {
            case[.unison]:
                type = .major
            case [.minorSecond]:
                type = .b9no3
            case [.majorSecond]:
                type = .sus2
            case [.minorThird]:
                type = .minor
            case [.majorThird]:
                type = .major
            case [.fourth]:
                type = .sus4
            case [.tritone]:
                type = .b5no3
            case [.fifth]:
                type = .five
            case [.minorSixth]:
                type = .augNo3
            case [.majorSixth]:
                type = .sixNo3
            case [.minorSeventh]:
                type = .sevenNo3
            case [.majorSeventh]:
                type = .maj7no3
            default:
                type = .NaN
            }
        } else {
            switch intervals {
            case [.unison, .minorSecond]:
                type = .b9no3
            case [.unison, .majorSecond]:
                type = .sus2
            case [.unison, .minorThird]:
                type = .minor
            case [.unison, .majorThird]:
                type = .major
            case [.unison, .fourth]:
                type = .sus4
            case [.unison, .tritone]:
                type = .b5no3
            case [.unison, .fifth]:
                type = .five
            case [.unison, .minorSixth]:
                type = .augNo3
            case [.unison, .majorSixth]:
                type = .sixNo3
            case [.unison, .minorSeventh]:
                type = .sevenNo3
            case [.unison, .majorSeventh]:
                type = .maj7no3

            case [.minorSecond, .majorSecond]:
                type = .sus2b9
            case [.minorSecond, .minorThird]:
                type = .mB9
            case [.minorSecond, .majorThird]:
                type = .b9
            case [.minorSecond, .fourth]:
                type = .sus4B9
            case [.minorSecond, .tritone]:
                type = .b5b9no3
            case [.minorSecond, .fifth]:
                type = .b9no3
            case [.minorSecond, .minorSixth]:
                type = .b6b9no3
            case [.minorSecond, .majorSixth]:
                type = .sixB9no3
            case [.minorSecond, .minorSeventh]:
                type = .sevenB9no3
            case [.minorSecond, .majorSeventh]:
                type = .maj7b9no3

            case [.majorSecond, .minorThird]:
                type = .mAdd9
            case [.majorSecond, .majorThird]:
                type = .add9
            case [.majorSecond, .fourth]:
                type = .sus4Add9
            case [.majorSecond, .tritone]:
                type = .sus2hash11
            case [.majorSecond, .fifth]:
                type = .sus2
            case [.majorSecond, .minorSixth]:
                type = .sus2b6
            case [.majorSecond, .majorSixth]:
                type = .sixSus2
            case [.majorSecond, .minorSeventh]:
                type = .sevenSus2
            case [.majorSecond, .majorSeventh]:
                type = .maj7sus2

            case [.minorThird, .majorThird]:
                type = .hash9
            case [.minorThird, .fourth]:
                type = .mAdd11
            case [.minorThird, .tritone]:
                type = .dim
            case [.minorThird, .fifth]:
                type = .minor
            case [.minorThird, .minorSixth]:
                type = .mB6
            case [.minorThird, .majorSixth]:
                type = .m6
            case [.minorThird, .minorSeventh]:
                type = .m7
            case [.minorThird, .majorSeventh]:
                type = .mMaj7

            case [.majorThird, .fourth]:
                type = .add11
            case [.majorThird, .tritone]:
                type = .hash11
            case [.majorThird, .fifth]:
                type = .major
            case [.majorThird, .minorSixth]:
                type = .aug
            case [.majorThird, .majorSixth]:
                type = .six
            case [.majorThird, .minorSeventh]:
                type = .seven
            case [.majorThird, .majorSeventh]:
                type = .maj7

            case [.fourth, .tritone]:
                type = .sus4b5
            case [.fourth, .fifth]:
                type = .sus4
            case [.fourth, .minorSixth]:
                type = .sus4b6
            case [.fourth, .majorSixth]:
                type = .sixSus4
            case [.fourth, .minorSeventh]:
                type = .sevenSus4
            case [.fourth, .majorSeventh]:
                type = .maj7sus4

            case [.tritone, .fifth]:
                type = .b5no3
            case [.tritone, .minorSixth]:
                type = .b5b6no3
            case [.tritone, .majorSixth]:
                type = .sixB5no3
            case [.tritone, .minorSeventh]:
                type = .sevenB5no3
            case [.tritone, .majorSeventh]:
                type = .maj7hash11no3

            case [.fifth, .minorSixth]:
                type = .b6no3
            case [.fifth, .majorSixth]:
                type = .sixNo3
            case [.fifth, .minorSeventh]:
                type = .sevenNo3
            case [.fifth, .majorSeventh]:
                type = .maj7no3

            case [.minorSixth, .majorSixth]:
                type = .dim6b13no5
            case [.minorSixth, .minorSeventh]:
                type = .sevenB13no3
            case [.minorSixth, .majorSeventh]:
                type = .maj7hash5no3

            case [.majorSixth, .minorSeventh]:
                type = .thirteenNo3
            case [.majorSixth, .majorSeventh]:
                type = .maj13no3

            case [.minorSeventh, .majorSeventh]:
                type = .sevenMaj7no3

            default:
                type = .NaN
            }
        }
    }

}
