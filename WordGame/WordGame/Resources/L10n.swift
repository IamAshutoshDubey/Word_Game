// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Correct Attempts: %d
  internal static func correctAttemptsStatusLabel(_ p1: Int) -> String {
    return L10n.tr("Localizable", "correct_attempts_status_label", p1)
  }
  /// Correct
  internal static let correctButtonTitle = L10n.tr("Localizable", "correct_button_title")
  /// Oops!
  internal static let errorTitle = L10n.tr("Localizable", "error_title")
  /// Game Over
  internal static let gameOverLable = L10n.tr("Localizable", "game_over_lable")
  /// Lets Play
  internal static let playButtonTitle = L10n.tr("Localizable", "play_button_title")
  /// Word Game
  internal static let playGameScreenTitle = L10n.tr("Localizable", "playGame_screen_title")
  /// Play With Words
  internal static let splashScreenTitle = L10n.tr("Localizable", "splash_screen_title")
  /// Uanble to Start Game.
  internal static let unableToStartGameError = L10n.tr("Localizable", "unable_to_start_game_error")
  /// Well Done!
  internal static let wellDoneLable = L10n.tr("Localizable", "well_done_lable")
  /// Wrong Attempts: %d
  internal static func wrongAttemptsStatusLabel(_ p1: Int) -> String {
    return L10n.tr("Localizable", "wrong_attempts_status_label", p1)
  }
  /// Wrong
  internal static let wrongButtonTitle = L10n.tr("Localizable", "wrong_button_title")
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
  static let bundle = Bundle(for: BundleToken.self)
}
// swiftlint:enable convenience_type
