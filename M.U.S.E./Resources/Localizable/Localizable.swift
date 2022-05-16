// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum Interval {
    /// Fifth
    internal static let fifth = L10n.tr("Localizable", "Interval.fifth")
    /// Fourth
    internal static let fourth = L10n.tr("Localizable", "Interval.fourth")
    /// Major Second
    internal static let majorSecond = L10n.tr("Localizable", "Interval.majorSecond")
    /// Major Seventh
    internal static let majorSeventh = L10n.tr("Localizable", "Interval.majorSeventh")
    /// Major Sixth
    internal static let majorSixth = L10n.tr("Localizable", "Interval.majorSixth")
    /// Major Third
    internal static let majorThird = L10n.tr("Localizable", "Interval.majorThird")
    /// Minor Second
    internal static let minorSecond = L10n.tr("Localizable", "Interval.minorSecond")
    /// Minor Seventh
    internal static let minorSeventh = L10n.tr("Localizable", "Interval.minorSeventh")
    /// Minor Sixth
    internal static let minorSixth = L10n.tr("Localizable", "Interval.minorSixth")
    /// Minor Third
    internal static let minorThird = L10n.tr("Localizable", "Interval.minorThird")
    /// Tritone
    internal static let tritone = L10n.tr("Localizable", "Interval.tritone")
    /// Unison
    internal static let unison = L10n.tr("Localizable", "Interval.unison")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
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
