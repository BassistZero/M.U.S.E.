struct Bar {

    // MARK: Public Properties

    var size: Time? {
        song?.time
    }
    var beats: [Beat] {
        get {
            _beats
        }
        set(beats) {
            do {
                try beats.forEach { try addBeat($0) }
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    // MARK: - Private Properties

    private var _beats: [Beat] = []
    private var song: Song?

    // MARK: - Public Methods

    mutating func addBeat(_ beat: Beat) throws {
        guard let size else { throw BarErrors.noSongAssigned }

        let max = size.rawValue
        var currentSize = 0

        _beats.forEach { currentSize += $0.length.rawValue }

        guard currentSize < max else { throw BarErrors.sizeOverflow }

        _beats.append(beat)
    }

}

// MARK: - Errors

private extension Bar {

    enum BarErrors: Error {

        case noSongAssigned
        case sizeOverflow

    }

}
