import UIKit

// MARK: - Status

/**
 Status is a holder of the current state
 with a few additional configuration properties.
 */
struct Status {
  /// The current state.
  let state: State

  /// A flag to enable/disable animation.
  let animated: Bool

  /// A text that overrides a text from the state.
  let text: String

  /**
   Creates a new instance of `Status`.

   - Parameter state: A state.
   - Parameter animated: A flag to enable/disable animation.
   - Parameter text: A text that overrides a text from the state.
   */
  init(_ state: State, animated: Bool = true, text: String? = nil) {
    self.state = state
    self.animated = animated
    self.text = text ?? state.text
  }
}

// MARK: - State.

/**
 Barcode scanner state.
 */
enum State {
  case Scanning, Processing, Unauthorized, NotFound

  typealias Styles = (tint: UIColor, font: UIFont, alignment: NSTextAlignment)

  /// State message.
  var text: String {
    let string: String

    switch self {
    case .Scanning:
      string = Info.text
    case .Processing:
      string = Info.loadingText
    case .Unauthorized:
      string = Info.settingsText
    case .NotFound:
      string = Info.notFoundText
    }

    return string
  }

  /// State styles.
  var styles: Styles {
    let styles: Styles

    switch self {
    case .Scanning:
      styles = (
        tint: Info.tint,
        font: Info.font,
        alignment: Info.textAlignment
      )
    case .Processing:
      styles = (
        tint: Info.loadingTint,
        font: Info.loadingFont,
        alignment: .Center
      )
    case .Unauthorized:
      styles = (
        tint: Info.tint,
        font: Info.font,
        alignment: .Left
      )
    case .NotFound:
      styles = (
        tint: Info.notFoundTint,
        font: Info.loadingFont,
        alignment: .Center
      )
    }

    return styles
  }
}
