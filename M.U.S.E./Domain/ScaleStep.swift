enum ScaleStep: Int, CaseIterable {

    case one = 0
    case two = 1
    case three
    case four
    case five
    case six
    case seven

}

// MARK: - CustomStringConvertible

extension ScaleStep: CustomStringConvertible {

    var description: String {
        switch self {
        case .one: return L10n.ScaleStep.one
        case .two: return L10n.ScaleStep.two
        case .three: return L10n.ScaleStep.three
        case .four: return L10n.ScaleStep.four
        case .five: return L10n.ScaleStep.five
        case .six: return L10n.ScaleStep.six
        case .seven: return L10n.ScaleStep.seven
        }
    }

}

// MARK: - Codable

extension ScaleStep: Codable { }

// MARK: -

extension ScaleStep: Comparable {

    static func < (lhs: ScaleStep, rhs: ScaleStep) -> Bool {
        lhs.rawValue < rhs.rawValue
    }

}
