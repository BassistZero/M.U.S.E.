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
  internal enum Genre {
    /// Metal
    internal static let metal = L10n.tr("Localizable", "Genre.metal", fallback: "Metal")
    /// Rock
    internal static let rock = L10n.tr("Localizable", "Genre.rock", fallback: "Rock")
  }
  internal enum Instrument {
    /// Bass
    internal static let bass = L10n.tr("Localizable", "Instrument.bass", fallback: "Bass")
    /// Drums
    internal static let drums = L10n.tr("Localizable", "Instrument.drums", fallback: "Drums")
    /// Guitar
    internal static let guitar = L10n.tr("Localizable", "Instrument.guitar", fallback: "Guitar")
    /// Keyboard
    internal static let keyboard = L10n.tr("Localizable", "Instrument.keyboard", fallback: "Keyboard")
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
  internal enum Key {
    /// Major
    internal static let major = L10n.tr("Localizable", "Key.major", fallback: "Major")
    /// Minor
    internal static let minor = L10n.tr("Localizable", "Key.minor", fallback: "Minor")
  }
  internal enum MainTabBar {
    internal enum Item {
      /// Chord
      internal static let chord = L10n.tr("Localizable", "MainTabBar.Item.chord", fallback: "Chord")
      /// Favorites
      internal static let favorites = L10n.tr("Localizable", "MainTabBar.Item.favorites", fallback: "Favorites")
      /// Progression
      internal static let progression = L10n.tr("Localizable", "MainTabBar.Item.progression", fallback: "Progression")
      /// Song Projects
      internal static let songBuilder = L10n.tr("Localizable", "MainTabBar.Item.songBuilder", fallback: "Song Projects")
    }
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
    /// I-V-IV-I
    internal static let oneFiveFourOne = L10n.tr("Localizable", "ProgressionVersion.oneFiveFourOne", fallback: "I-V-IV-I")
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
      /// Don't Suggest the Progression
      internal static let blacklistProgression = L10n.tr("Localizable", "ProgressionViewController.Buttons.blacklistProgression", fallback: "Don't Suggest the Progression")
      /// Generate Progression
      internal static let generateProgression = L10n.tr("Localizable", "ProgressionViewController.Buttons.generateProgression", fallback: "Generate Progression")
      /// Play Progression
      internal static let playProgression = L10n.tr("Localizable", "ProgressionViewController.Buttons.playProgression", fallback: "Play Progression")
    }
  }
  internal enum ScaleStep {
    /// V
    internal static let five = L10n.tr("Localizable", "ScaleStep.five", fallback: "V")
    /// IV
    internal static let four = L10n.tr("Localizable", "ScaleStep.four", fallback: "IV")
    /// I
    internal static let one = L10n.tr("Localizable", "ScaleStep.one", fallback: "I")
    /// VII
    internal static let seven = L10n.tr("Localizable", "ScaleStep.seven", fallback: "VII")
    /// VI
    internal static let six = L10n.tr("Localizable", "ScaleStep.six", fallback: "VI")
    /// III
    internal static let three = L10n.tr("Localizable", "ScaleStep.three", fallback: "III")
    /// II
    internal static let two = L10n.tr("Localizable", "ScaleStep.two", fallback: "II")
  }
  internal enum SongBuilder {
    internal enum Detail {
      internal enum Configuration {
        /// 
        internal static let downButton = L10n.tr("Localizable", "SongBuilder.Detail.Configuration.downButton", fallback: "")
        /// Tempo
        internal static let tempoName = L10n.tr("Localizable", "SongBuilder.Detail.Configuration.tempoName", fallback: "Tempo")
        /// Size
        internal static let timeName = L10n.tr("Localizable", "SongBuilder.Detail.Configuration.timeName", fallback: "Size")
        /// 
        internal static let upButton = L10n.tr("Localizable", "SongBuilder.Detail.Configuration.upButton", fallback: "")
      }
      internal enum Instruments {
        /// Add New Instrument
        internal static let addNewInstrument = L10n.tr("Localizable", "SongBuilder.Detail.Instruments.addNewInstrument", fallback: "Add New Instrument")
        /// Empty
        internal static let emptyParts = L10n.tr("Localizable", "SongBuilder.Detail.Instruments.emptyParts", fallback: "Empty")
        /// Parts
        internal static let partsName = L10n.tr("Localizable", "SongBuilder.Detail.Instruments.partsName", fallback: "Parts")
        internal enum AddingAlert {
          /// Cancel
          internal static let cancel = L10n.tr("Localizable", "SongBuilder.Detail.Instruments.AddingAlert.cancel", fallback: "Cancel")
          /// Choose The Instrument
          internal static let title = L10n.tr("Localizable", "SongBuilder.Detail.Instruments.AddingAlert.title", fallback: "Choose The Instrument")
        }
      }
      internal enum Structure {
        internal enum Detail {
          internal enum AssignedInstruments {
            /// No Instruments
            internal static let emptyInstruments = L10n.tr("Localizable", "SongBuilder.Detail.Structure.Detail.AssignedInstruments.emptyInstruments", fallback: "No Instruments")
            /// Instruments
            internal static let titleName = L10n.tr("Localizable", "SongBuilder.Detail.Structure.Detail.AssignedInstruments.titleName", fallback: "Instruments")
          }
          internal enum StructurePartProgression {
            /// Progression
            internal static let titleName = L10n.tr("Localizable", "SongBuilder.Detail.Structure.Detail.StructurePartProgression.titleName", fallback: "Progression")
          }
        }
        internal enum Main {
          /// Add New Structure Part
          internal static let addNewStructurePart = L10n.tr("Localizable", "SongBuilder.Detail.Structure.Main.addNewStructurePart", fallback: "Add New Structure Part")
          /// Structure Part
          internal static let menuTitle = L10n.tr("Localizable", "SongBuilder.Detail.Structure.Main.menuTitle", fallback: "Structure Part")
          /// Repeating
          internal static let repeatingBarName = L10n.tr("Localizable", "SongBuilder.Detail.Structure.Main.repeatingBarName", fallback: "Repeating")
          /// Reusing
          internal static let reuseName = L10n.tr("Localizable", "SongBuilder.Detail.Structure.Main.reuseName", fallback: "Reusing")
        }
      }
    }
    internal enum Main {
      /// Add New Song
      internal static let addNewSong = L10n.tr("Localizable", "SongBuilder.Main.addNewSong", fallback: "Add New Song")
      /// Song
      internal static let templateSongName = L10n.tr("Localizable", "SongBuilder.Main.templateSongName", fallback: "Song")
      internal enum AddingAlert {
        /// Cancel
        internal static let cancel = L10n.tr("Localizable", "SongBuilder.Main.AddingAlert.cancel", fallback: "Cancel")
        /// Song Name
        internal static let placeholder = L10n.tr("Localizable", "SongBuilder.Main.AddingAlert.placeholder", fallback: "Song Name")
        /// Decide Later
        internal static let proceedWithDummyName = L10n.tr("Localizable", "SongBuilder.Main.AddingAlert.proceedWithDummyName", fallback: "Decide Later")
        /// OK
        internal static let proceedWithSongName = L10n.tr("Localizable", "SongBuilder.Main.AddingAlert.proceedWithSongName", fallback: "OK")
        /// Enter the Song Name
        internal static let title = L10n.tr("Localizable", "SongBuilder.Main.AddingAlert.title", fallback: "Enter the Song Name")
      }
      internal enum DeletionAlert {
        /// Cancel
        internal static let cancel = L10n.tr("Localizable", "SongBuilder.Main.DeletionAlert.cancel", fallback: "Cancel")
        /// This data will be erased for good
        internal static let message = L10n.tr("Localizable", "SongBuilder.Main.DeletionAlert.message", fallback: "This data will be erased for good")
        /// Yes, Delete It
        internal static let ok = L10n.tr("Localizable", "SongBuilder.Main.DeletionAlert.ok", fallback: "Yes, Delete It")
        /// Are you sure?
        internal static let title = L10n.tr("Localizable", "SongBuilder.Main.DeletionAlert.title", fallback: "Are you sure?")
      }
    }
  }
  internal enum SongTabBar {
    internal enum Item {
      /// ⚙️
      internal static let configuration = L10n.tr("Localizable", "SongTabBar.Item.configuration", fallback: "⚙️")
      /// 🎸🎹🥁
      internal static let instruments = L10n.tr("Localizable", "SongTabBar.Item.instruments", fallback: "🎸🎹🥁")
      /// Result
      internal static let result = L10n.tr("Localizable", "SongTabBar.Item.result", fallback: "Result")
      /// Structure
      internal static let structure = L10n.tr("Localizable", "SongTabBar.Item.structure", fallback: "Structure")
    }
  }
  internal enum StructurePart {
    /// Bridge
    internal static let bridge = L10n.tr("Localizable", "StructurePart.bridge", fallback: "Bridge")
    /// Chorus
    internal static let chorus = L10n.tr("Localizable", "StructurePart.chorus", fallback: "Chorus")
    /// Intro
    internal static let intro = L10n.tr("Localizable", "StructurePart.intro", fallback: "Intro")
    /// Outro
    internal static let outro = L10n.tr("Localizable", "StructurePart.outro", fallback: "Outro")
    /// Pre-Chorus
    internal static let preChorus = L10n.tr("Localizable", "StructurePart.preChorus", fallback: "Pre-Chorus")
    /// Pre-Outro
    internal static let preOutro = L10n.tr("Localizable", "StructurePart.preOutro", fallback: "Pre-Outro")
    /// Pre-Solo
    internal static let preSolo = L10n.tr("Localizable", "StructurePart.preSolo", fallback: "Pre-Solo")
    /// Pre-Verse
    internal static let preVerse = L10n.tr("Localizable", "StructurePart.preVerse", fallback: "Pre-Verse")
    /// Solo
    internal static let solo = L10n.tr("Localizable", "StructurePart.solo", fallback: "Solo")
    /// Verse
    internal static let verse = L10n.tr("Localizable", "StructurePart.verse", fallback: "Verse")
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
