enum Instrument: CaseIterable {

    case guitar
    case bass
    case keyboard
    case drums

}

// MARK: - CustomStringConvertible

extension Instrument: CustomStringConvertible {

    var description: String {
        switch self {
        case .guitar: return L10n.Instrument.guitar
        case .bass: return L10n.Instrument.bass
        case .keyboard: return L10n.Instrument.keyboard
        case .drums: return L10n.Instrument.drums
        }
    }

}

// MARK: - Comparable

extension Instrument: Comparable { }
