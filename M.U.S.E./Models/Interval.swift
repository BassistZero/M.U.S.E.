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
            return L10n.Interval.unison
        case .minorSecond:
            return L10n.Interval.minorSecond
        case .majorSecond:
            return L10n.Interval.majorSecond
        case .minorThird:
            return L10n.Interval.minorThird
        case .majorThird:
            return L10n.Interval.majorThird
        case .fourth:
            return L10n.Interval.fourth
        case .tritone:
            return L10n.Interval.tritone
        case .fifth:
            return L10n.Interval.fifth
        case .minorSixth:
            return L10n.Interval.minorSixth
        case .majorSixth:
            return L10n.Interval.majorSixth
        case .minorSeventh:
            return L10n.Interval.minorSeventh
        case .majorSeventh:
            return L10n.Interval.majorSeventh
        }
    }

}
