//
//  Chord.swift
//  M.U.S.E.
//
//  Created by Bassist_Zero on 4/26/22.
//

struct Chord {

    var notes: [Note] {
        didSet {
            self.notes.sort { $0.value.rawValue < $1.value.rawValue }

            var intervals = [Interval]()

            for i in 1...notes.count - 1 {
                intervals.append(self.notes[0].interval(note: self.notes[i]))
            }

            self.intervals = intervals

            setType()
        }
    }
    var intervals = [Interval]()
    var type = ChordType.NaN

    init(notes: [Note]) {
        self.notes = notes

        self.notes.sort { $0.value.rawValue < $1.value.rawValue }

        var intervals = [Interval]()

        for i in 1...notes.count - 1 {
            intervals.append(self.notes[0].interval(note: self.notes[i]))
        }

        self.intervals = intervals

        setType()
    }

    private mutating func setType() {
        if intervals[0] == intervals[1] {
            intervals = [intervals[0]]

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
            case [.octave]:
                type = .major
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
            case [.unison, .octave]:
                type = .major

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
            case [.minorSecond, .octave]:
                type = .b9no3

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
            case [.majorSecond, .octave]:
                type = .sus2

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
            case [.minorThird, .octave]:
                type = .minor

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
            case [.majorThird, .octave]:
                type = .major

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
            case [.fourth, .octave]:
                type = .sus4

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
            case [.tritone, .octave]:
                type = .b5no3

            case [.fifth, .minorSixth]:
                type = .b6no3
            case [.fifth, .majorSixth]:
                type = .sixNo3
            case [.fifth, .minorSeventh]:
                type = .sevenNo3
            case [.fifth, .majorSeventh]:
                type = .maj7no3
            case [.fifth, .octave]:
                type = .five

            case [.minorSixth, .majorSixth]:
                type = .dim6b13no5
            case [.minorSixth, .minorSeventh]:
                type = .sevenB13no3
            case [.minorSixth, .majorSeventh]:
                type = .maj7hash5no3
            case [.minorSixth, .octave]:
                type = .augNo3

            case [.majorSixth, .minorSeventh]:
                type = .thirteenNo3
            case [.majorSixth, .majorSeventh]:
                type = .maj13no3
            case [.majorSixth, .octave]:
                type = .sixNo3

            case [.minorSeventh, .majorSeventh]:
                type = .sevenMaj7no3
            case [.minorSeventh, .octave]:
                type = .sevenNo3

            case [.majorSeventh, .octave]:
                type = .maj7no3

            default:
                type = .NaN
            }
        }
    }

    enum ChordType {

        case major

        case maj7
        case maj7no3
        case maj7sus2
        case maj7sus4
        case maj7b9no3
        case maj7hash5no3
        case maj7hash11no3
        case maj13no3

        case minor

        case mB6
        case m6
        case m7
        case mB9
        case mAdd9
        case mAdd11
        case mMaj7

        case five

        case aug
        case augNo3

        case dim
        case dim6b13no5

        case sus2
        case sus2b6
        case sus2b9
        case sus2hash11

        case sus4
        case sus4b5
        case sus4b6
        case sus4B9
        case sus4Add9

        case six
        case sixNo3
        case sixSus2
        case sixSus4
        case sixB5no3
        case sixB9no3

        case seven
        case sevenNo3
        case sevenSus2
        case sevenSus4
        case sevenB5no3
        case sevenB9no3
        case sevenB13no3
        case sevenMaj7no3

        case add9
        case hash9
        case add11
        case hash11
        case b5no3
        case b5b6no3
        case b5b9no3
        case b6no3
        case b6b9no3
        case b9
        case b9no3
        case thirteenNo3

        case NaN
    }

}
