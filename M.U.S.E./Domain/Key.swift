struct Key {

    let value: NoteValue
    let color: KeyColor

    init(value: NoteValue, color: KeyColor) {
        self.value = value
        self.color = color
    }

    init?(value: NoteValue, color: ChordType) {
        self.value = value

        switch color {
        case .major: self.color = .major
        case .minor: self.color = .minor
        default: return nil
        }
    }

}

// MARK: - KeyColor

extension Key {

    enum KeyColor {
        case major
        case minor
    }

}

// MARK: - CustomStringConvertible

extension Key: CustomStringConvertible {

    var description: String {
        "\(value.plainSymbols) \(color.plain)"
    }

}

extension Key.KeyColor: CustomStringConvertible {

    var description: String {
        switch self {
        case .major: return L10n.Key.major
        case .minor: return L10n.Key.minor
        }
    }

    var plain: String {
        switch self {
        case .major: return L10n.Key.Major.plain
        case .minor: return L10n.Key.Minor.plain
        }
    }

}
