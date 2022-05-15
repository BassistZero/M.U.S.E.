//
//  Interval.swift
//  M.U.S.E.
//
//  Created by Bassist_Zero on 4/26/22.
//

enum Interval: Int, CaseIterable {

    case unison = 0
    case minorSecond = 1
    case majorSecond
    case minorThird
    case majorThird
    case fourth
    case tritone
    case fifth
    case minorSixth
    case majorSixth
    case minorSeventh
    case majorSeventh

}

// MARK: - Comparable

extension Interval: Comparable {

    static func < (lhs: Interval, rhs: Interval) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }

}

// MARK: - CustomStringConvertible

extension Interval: CustomStringConvertible {

    var description: String {
        switch self {
        case .unison:
            return "Unison"
        case .minorSecond:
            return "Minor Second"
        case .majorSecond:
            return "Major Second"
        case .minorThird:
            return "Minor Third"
        case .majorThird:
            return "Major Third"
        case .fourth:
            return "Fourth"
        case .tritone:
            return "Tritone"
        case .fifth:
            return "Fifth"
        case .minorSixth:
            return "Minor Sixth"
        case .majorSixth:
            return "Major Sixth"
        case .minorSeventh:
            return "Minor Seventh"
        case .majorSeventh:
            return "Major Seventh"
        }
    }

}
