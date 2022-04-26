//
//  Note.swift
//  M.U.S.E.
//
//  Created by Bassist_Zero on 4/23/22.
//

struct Note {

    let octave: Octave
    let value: NoteValue
    private var absolete: Int {
        return octave.rawValue + value.rawValue
    }

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

    func interval(note: Note) -> Interval {
        return Interval.init(rawValue: note.absolete - absolete)!
    }

    enum NoteValue: Int, CaseIterable, CustomStringConvertible {

        case c = 0
        case cSharp = 1
        case d
        case dSharp
        case e
        case f
        case fSharp
        case g
        case gSharp
        case a
        case aSharp
        case b

        var description: String {
            switch self {
            case .c:
                return "C"
            case .cSharp:
                return "C#"
            case .d:
                return "D"
            case .dSharp:
                return "D#"
            case .e:
                return "E"
            case .f:
                return "F"
            case .fSharp:
                return "F#"
            case .g:
                return "G"
            case .gSharp:
                return "G#"
            case .a:
                return "A"
            case .aSharp:
                return "A#"
            case .b:
                return "B"
            }
        }

    }

}

extension Note: CustomStringConvertible {

    var description: String {
        return String(octave.rawValue) + value.description
    }

}
