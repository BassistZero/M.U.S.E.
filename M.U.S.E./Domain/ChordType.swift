enum ChordType: CaseIterable {

    case major

    case maj7
    case maj7no3
    case maj7sus2
    case maj7sus4
    case maj7b9no3
    case maj7hash5no3
    case maj7hash11no3
    case maj13no3

    case minor

    case mB6
    case m6
    case m7
    case mB9
    case mAdd9
    case mAdd11
    case mMaj7

    case five

    case aug
    case augNo3

    case dim
    case dim6b13no5

    case sus2
    case sus2b6
    case sus2b9
    case sus2hash11

    case sus4
    case sus4b5
    case sus4b6
    case sus4B9
    case sus4Add9

    case six
    case sixNo3
    case sixSus2
    case sixSus4
    case sixB5no3
    case sixB9no3

    case seven
    case sevenNo3
    case sevenSus2
    case sevenSus4
    case sevenB5no3
    case sevenB9no3
    case sevenB13no3
    case sevenMaj7no3

    case add9
    case hash9
    case add11
    case hash11
    case b5no3
    case b5b6no3
    case b5b9no3
    case b6no3
    case b6b9no3
    case b9
    case b9no3
    case thirteenNo3

    case NaN
}

// MARK: - CustomStringConvertible

extension ChordType: CustomStringConvertible {

    var description: String {
        switch self {

        case .major:
            return ""
        case .maj7:
            return "maj7"
        case .maj7no3:
            return "maj7-(no3)"
        case .maj7sus2:
            return "maj7-sus2"
        case .maj7sus4:
            return "maj7-sus4"
        case .maj7b9no3:
            return "maj7-(b9)-(no3)"
        case .maj7hash5no3:
            return "maj7-(#5)-(no3)"
        case .maj7hash11no3:
            return "maj7-(#11)-(no3)"
        case .maj13no3:
            return "maj13-(no3)"
        case .minor:
            return "m"
        case .mB6:
            return "m-(b6)"
        case .m6:
            return "m-(6)"
        case .m7:
            return "m-(7)"
        case .mB9:
            return "m-(b9)"
        case .mAdd9:
            return "m-(add9)"
        case .mAdd11:
            return "m-(add11)"
        case .mMaj7:
            return "m-maj7"
        case .five:
            return "5"
        case .aug:
            return "aug"
        case .augNo3:
            return "aug-(no3)"
        case .dim:
            return "dim"
        case .dim6b13no5:
            return "dim-(6)-(b13)-(no5)"
        case .sus2:
            return "sus2"
        case .sus2b6:
            return "sus2-(b6)"
        case .sus2b9:
            return "sus2-(b9)"
        case .sus2hash11:
            return "sus2-(#11)"
        case .sus4:
            return "sus4"
        case .sus4b5:
            return "sus4-(b5)"
        case .sus4b6:
            return "sus4-(b6)"
        case .sus4B9:
            return "sus4-(b9)"
        case .sus4Add9:
            return "sus4-(add9)"
        case .six:
            return "6"
        case .sixNo3:
            return "6-(no3)"
        case .sixSus2:
            return "6-sus2"
        case .sixSus4:
            return "6-sus4"
        case .sixB5no3:
            return "6-(b5)-(no3)"
        case .sixB9no3:
            return "6-(b9)-(no3)"
        case .seven:
            return "7"
        case .sevenNo3:
            return "7-(no3)"
        case .sevenSus2:
            return "7-sus2"
        case .sevenSus4:
            return "7-sus4"
        case .sevenB5no3:
            return "7-(b5)-(no3)"
        case .sevenB9no3:
            return "7-(b9)-(no3)"
        case .sevenB13no3:
            return "7-(b13)-(no3)"
        case .sevenMaj7no3:
            return "7-maj7-(no3)"
        case .add9:
            return "(add9)"
        case .hash9:
            return "(#9)"
        case .add11:
            return "(add11)"
        case .hash11:
            return "(#11)"
        case .b5no3:
            return "(b5)-(no3)"
        case .b5b6no3:
            return "(b5)-(b6)-(no3)"
        case .b5b9no3:
            return "(b5)-(b9)-(no3)"
        case .b6no3:
            return "(b6)-(no3)"
        case .b6b9no3:
            return "(b6)-(b9)-(no3)"
        case .b9:
            return "(b9)"
        case .b9no3:
            return "(b9)-(no3)"
        case .thirteenNo3:
            return "13-(no3)"
        case .NaN:
            return "Unknown"
        }
    }

}
