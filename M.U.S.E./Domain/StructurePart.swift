enum StructurePart: CaseIterable {

    case intro
    case verse
    case chorus
    case bridge
    case solo
    case outro

}

// MARK: - CustomStringConvertible

extension StructurePart: CustomStringConvertible {

    var description: String {
        switch self {
        case .intro: return L10n.StructurePart.intro
        case .verse: return L10n.StructurePart.verse
        case .chorus: return L10n.StructurePart.chorus
        case .bridge: return L10n.StructurePart.bridge
        case .solo: return L10n.StructurePart.solo
        case .outro: return L10n.StructurePart.outro
        }
    }

}
