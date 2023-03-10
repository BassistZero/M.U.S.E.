enum Octave: Int, CaseIterable {

    case zero = 0
    case one = 1
    case two
    case three
    case four
    case five
    case six
    case seven

}

// MARK: - CustomStringConvertible

extension Octave: CustomStringConvertible {

    var description: String {
        return "\(self.rawValue)"
    }

}
