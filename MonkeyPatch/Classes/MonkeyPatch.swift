import Foundation

/// The MonkeyPatchable protocol supplies a Type with the ability to store temporary replacement values that are persisted using `UserDefaults`.
protocol MonkeyPatchable {
  static func setMonkeyPatch(lookupKey: String, value: Self?)
  static func lookupMonkeyPatch(lookupKey: String) -> Self?
  
  func monkeyPatch(lookupKey: String) -> Self
}

extension MonkeyPatchable {
  
  // MARK: Helpers
  
  static private func decorateDictionaryKey(lookupKey: String) -> String {
    return "DebugMonkeyPatch-\(lookupKey)"
  }
  
  // MARK: Class Functions
  
  /// This method allows you to set a replacement value for the given `lookupKey` in the `UserDefaults`. This value can then be optained using the `monkeyPatch` method anywhere in the app.
  static func setMonkeyPatch(lookupKey: String, value: Self?) {
    NSUserDefaults.standardUserDefaults().setValue(value as? AnyObject, forKey: decorateDictionaryKey(lookupKey))
  }
  
  static func lookupMonkeyPatch(lookupKey: String) -> Self? {
    return NSUserDefaults.standardUserDefaults().objectForKey(decorateDictionaryKey(lookupKey)) as? Self
  }
  
  // MARK: Instance Functions
  
  /// During runtime, this method checks if a replacement value for the given `lookupKey` has been stored on the device's `UserDefaults` and returns that. If no replacement value can be found, it just returns the value you just set.
  func monkeyPatch(lookupKey: String) -> Self {
    return Self.lookupMonkeyPatch(lookupKey) ?? self
  }
  
  /// During runtime, this method checks if a replacement value for the given `lookupKey` has been stored on the device's `UserDefaults` and returns that. If no replacement value can be found, it just returns the value you just set.
  func 🙊💬(lookupKey: String) -> Self {
    return monkeyPatch(lookupKey)
  }
}