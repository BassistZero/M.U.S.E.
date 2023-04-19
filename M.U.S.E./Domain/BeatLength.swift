enum BeatLength: Int {

    case whole = 768
    case half = 384
    case quarter = 192
    case eighth = 96
    case sixteenth = 48
    case thirtySecond = 24
    case sixtyFourth = 12
    case oneHundredTwentyEighth = 6
    case twoHundredFiftySixth = 3

    case wholeTriplet = 512
    case halfTriplet = 256
    case quarterTriplet = 128
    case eighthTriplet = 64
    case sixteenthTriplet = 32
    case thirtySecondTriplet = 16
    case sixtyFourthTriplet = 8
    case oneHundredTwentyEighthTriplet = 4
    case twoHundredFiftySixthTriplet = 2

}

// MARK: - CustomStringConvertible

extension BeatLength: CustomStringConvertible {

    var description: String {
        switch self {
        case .whole: return "1"
        case .half: return "2"
        case .quarter: return "4"
        case .eighth: return "8"
        case .sixteenth: return "16"
        case .thirtySecond: return "32"
        case .sixtyFourth: return "64"
        case .oneHundredTwentyEighth: return "128"
        case .twoHundredFiftySixth: return "256"
        default: return ""
        }
    }

}
