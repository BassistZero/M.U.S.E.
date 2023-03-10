enum NoteValue: Int, CaseIterable {

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

}

// MARK: - CustomStringConvertible

extension NoteValue: CustomStringConvertible {

    var description: String {
        switch self {
        case .c:
            return L10n.Note.c
        case .cSharp:
            return L10n.Note.cSharp
        case .d:
            return L10n.Note.d
        case .dSharp:
            return L10n.Note.dSharp
        case .e:
            return L10n.Note.e
        case .f:
            return L10n.Note.f
        case .fSharp:
            return L10n.Note.fSharp
        case .g:
            return L10n.Note.g
        case .gSharp:
            return L10n.Note.gSharp
        case .a:
            return L10n.Note.a
        case .aSharp:
            return L10n.Note.aSharp
        case .b:
            return L10n.Note.b
        }
    }

}
