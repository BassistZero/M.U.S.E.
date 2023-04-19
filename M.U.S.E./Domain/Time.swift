struct Time {

    // MARK: - Public Properties

    var rawValue: Int {
        up * down.rawValue
    }

    // MARK: - Public Properties

    var up: Int
    var down: BeatLength

    // MARK: - Inits

    init(up: Int, down: BeatLength) {
        self.up = up
        self.down = down
    }

}

// MARK: - CustomStringConvertible

extension Time: CustomStringConvertible {

    var description: String {
        return "\(up)/\(down.description)"
    }

}
