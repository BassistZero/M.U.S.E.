// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum ChordViewController {
    internal enum Buttons {
      /// Play Chord
      internal static let playChord = L10n.tr("Localizable", "ChordViewController.Buttons.playChord", fallback: "Play Chord")
      /// Sort Notes
      internal static let sort = L10n.tr("Localizable", "ChordViewController.Buttons.sort", fallback: "Sort Notes")
      /// New Chord
      internal static let update = L10n.tr("Localizable", "ChordViewController.Buttons.update", fallback: "New Chord")
    }
    internal enum Switch {
      /// Is polyphony:
      internal static let text = L10n.tr("Localizable", "ChordViewController.Switch.text", fallback: "Is polyphony:")
    }
    internal enum Text {
      /// Chord
      internal static let chord = L10n.tr("Localizable", "ChordViewController.Text.chord", fallback: "Chord")
      /// Intervals
      internal static let intervals = L10n.tr("Localizable", "ChordViewController.Text.intervals", fallback: "Intervals")
      /// Root
      internal static let rootNote = L10n.tr("Localizable", "ChordViewController.Text.rootNote", fallback: "Root")
    }
  }
  internal enum Interval {
    /// Fifth
    internal static let fifth = L10n.tr("Localizable", "Interval.fifth", fallback: "Fifth")
    /// Fourth
    internal static let fourth = L10n.tr("Localizable", "Interval.fourth", fallback: "Fourth")
    /// Major Second
    internal static let majorSecond = L10n.tr("Localizable", "Interval.majorSecond", fallback: "Major Second")
    /// Major Seventh
    internal static let majorSeventh = L10n.tr("Localizable", "Interval.majorSeventh", fallback: "Major Seventh")
    /// Major Sixth
    internal static let majorSixth = L10n.tr("Localizable", "Interval.majorSixth", fallback: "Major Sixth")
    /// Major Third
    internal static let majorThird = L10n.tr("Localizable", "Interval.majorThird", fallback: "Major Third")
    /// Minor Second
    internal static let minorSecond = L10n.tr("Localizable", "Interval.minorSecond", fallback: "Minor Second")
    /// Minor Seventh
    internal static let minorSeventh = L10n.tr("Localizable", "Interval.minorSeventh", fallback: "Minor Seventh")
    /// Minor Sixth
    internal static let minorSixth = L10n.tr("Localizable", "Interval.minorSixth", fallback: "Minor Sixth")
    /// Minor Third
    internal static let minorThird = L10n.tr("Localizable", "Interval.minorThird", fallback: "Minor Third")
    /// Tritone
    internal static let tritone = L10n.tr("Localizable", "Interval.tritone", fallback: "Tritone")
    /// Unison
    internal static let unison = L10n.tr("Localizable", "Interval.unison", fallback: "Unison")
  }
  internal enum Note {
    /// A
    internal static let a = L10n.tr("Localizable", "Note.a", fallback: "A")
    /// A#
    internal static let aSharp = L10n.tr("Localizable", "Note.aSharp", fallback: "A#")
    /// B
    internal static let b = L10n.tr("Localizable", "Note.b", fallback: "B")
    /// C
    internal static let c = L10n.tr("Localizable", "Note.c", fallback: "C")
    /// C#
    internal static let cSharp = L10n.tr("Localizable", "Note.cSharp", fallback: "C#")
    /// D
    internal static let d = L10n.tr("Localizable", "Note.d", fallback: "D")
    /// D#
    internal static let dSharp = L10n.tr("Localizable", "Note.dSharp", fallback: "D#")
    /// E
    internal static let e = L10n.tr("Localizable", "Note.e", fallback: "E")
    /// F
    internal static let f = L10n.tr("Localizable", "Note.f", fallback: "F")
    /// F#
    internal static let fSharp = L10n.tr("Localizable", "Note.fSharp", fallback: "F#")
    /// G
    internal static let g = L10n.tr("Localizable", "Note.g", fallback: "G")
    /// G#
    internal static let gSharp = L10n.tr("Localizable", "Note.gSharp", fallback: "G#")
  }
  internal enum ProgressionType {
    /// Major
    internal static let major = L10n.tr("Localizable", "ProgressionType.major", fallback: "Major")
    /// Minor
    internal static let minor = L10n.tr("Localizable", "ProgressionType.minor", fallback: "Minor")
  }
  internal enum ProgressionTypeColor {
    /// Harmonic
    internal static let harmonic = L10n.tr("Localizable", "ProgressionTypeColor.harmonic", fallback: "Harmonic")
    /// Melodic
    internal static let melodic = L10n.tr("Localizable", "ProgressionTypeColor.melodic", fallback: "Melodic")
    /// Natural
    internal static let natural = L10n.tr("Localizable", "ProgressionTypeColor.natural", fallback: "Natural")
  }
  internal enum ProgressionVersion {
    /// I-VI-IV-V
    internal static let oneSixFourFive = L10n.tr("Localizable", "ProgressionVersion.oneSixFourFive", fallback: "I-VI-IV-V")
    /// I-III-IV-V
    internal static let oneThreeFourFive = L10n.tr("Localizable", "ProgressionVersion.oneThreeFourFive", fallback: "I-III-IV-V")
    /// I-II-III-IV
    internal static let oneTwoThreeFour = L10n.tr("Localizable", "ProgressionVersion.oneTwoThreeFour", fallback: "I-II-III-IV")
    /// Random
    internal static let random = L10n.tr("Localizable", "ProgressionVersion.random", fallback: "Random")
  }
  internal enum ProgressionViewController {
    internal enum Buttons {
      /// Generate Progression
      internal static let generateProgression = L10n.tr("Localizable", "ProgressionViewController.Buttons.generateProgression", fallback: "Generate Progression")
      /// Play Progression
      internal static let playProgression = L10n.tr("Localizable", "ProgressionViewController.Buttons.playProgression", fallback: "Play Progression")
    }
  }
  internal enum TabBar {
    internal enum Item {
      /// Chord
      internal static let chord = L10n.tr("Localizable", "TabBar.item.chord", fallback: "Chord")
      /// Favorites
      internal static let favorites = L10n.tr("Localizable", "TabBar.item.favorites", fallback: "Favorites")
      /// Progression
      internal static let progression = L10n.tr("Localizable", "TabBar.item.progression", fallback: "Progression")
      /// Music Project
      internal static let songBuilder = L10n.tr("Localizable", "TabBar.item.songBuilder", fallback: "Music Project")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
