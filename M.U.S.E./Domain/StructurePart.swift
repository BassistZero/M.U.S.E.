enum StructurePart: CaseIterable {

    case intro
    case preVerse
    case verse
    case preChorus
    case chorus
    case bridge
    case preSolo
    case solo
    case preOutro
    case outro

}

// MARK: - CustomStringConvertible

extension StructurePart: CustomStringConvertible {

    var description: String {
        switch self {
        case .intro:
            return L10n.StructurePart.intro
        case .preVerse:
            return L10n.StructurePart.preVerse
        case .verse:
            return L10n.StructurePart.verse
        case .preChorus:
            return L10n.StructurePart.preChorus
        case .chorus:
            return L10n.StructurePart.chorus
        case .bridge:
            return L10n.StructurePart.bridge
        case .preSolo:
            return L10n.StructurePart.preSolo
        case .solo:
            return L10n.StructurePart.solo
        case .preOutro:
            return L10n.StructurePart.preOutro
        case .outro:
            return L10n.StructurePart.outro
        }
    }

}
