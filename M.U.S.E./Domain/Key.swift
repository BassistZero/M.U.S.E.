struct Key {

    let value: NoteValue
    let color: KeyColor

}

extension Key {

    enum KeyColor {
        case major
        case minor
    }

}
