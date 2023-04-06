struct Time {

    // MARK: - Public Properties

    var rawValue: Int {
        up * down.rawValue
    }

    // MARK: - Private Properties

    private let up: Int
    private let down: BeatLength

    // MARK: - Inits

    init(up: Int, down: BeatLength) {
        self.up = up
        self.down = down
    }

}
