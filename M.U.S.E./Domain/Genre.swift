enum Genre {

    case rock
    case metal

}

// MARK: - CustomStringConvertible

extension Genre: CustomStringConvertible {

    var description: String {
        switch self {
        case .metal: return L10n.Genre.metal
        case .rock: return L10n.Genre.rock
        }
    }

}
