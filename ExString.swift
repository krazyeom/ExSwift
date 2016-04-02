import Foundation
import GameplayKit

extension String {

  var length: Int {
    get {
      return characters.count
    }
  }

  var count: Int {
    get {
      return length
    }
  }

  func charAt(at: Int) -> Character? {
    return self[at]
  }

  subscript (at: Int) -> Character? {
    if characters.count > at {
      let char = startIndex.advancedBy(at)
      return self[char]
    }
    return nil
  }

  func contains(aString: String) -> Bool {
    return NSString(string: self).containsString(aString)
  }

  var letterize: [String] {
    get {
      return characters.map{ String($0) }
    }
  }

  var letterizeCharacter: [Character] {
    get {
      return Array(self.characters)
    }
  }

  var asciiValue: Int {
    get {
      guard let ascii = unicodeScalars.first else { return -1 }

      return Int(ascii.value)
    }
  }

  static func unicodeScalar(ascci: Int) -> String {
    return String(UnicodeScalar(ascci))
  }

  func reverseBySeparator(separator: String) -> String {
    var idx = 0

    return componentsSeparatedByString(separator).reverse().reduce(""){
      (wholeString: String, addString: String) -> String in

      let spaceMaybe = (idx == 0) ?  "" : separator
      idx += 1

      return "\(wholeString)\(spaceMaybe)\(addString)"
    }
  }

  var trimmedLeft: String {
    get {
      let set: NSCharacterSet = NSCharacterSet.whitespaceAndNewlineCharacterSet()
      if let range = rangeOfCharacterFromSet(set.invertedSet) {
        return self[range.startIndex..<endIndex]
      }

      return ""
    }
  }

  var trimmedRight: String {
    get {
      let set: NSCharacterSet = NSCharacterSet.whitespaceAndNewlineCharacterSet()
      if let range = rangeOfCharacterFromSet(set.invertedSet, options: NSStringCompareOptions.BackwardsSearch) {
        return self[startIndex..<range.endIndex]
      }

      return ""
    }
  }

  var trimmed: String {
    get {
      return trimmedLeft.trimmedRight
    }
  }

  static func random(len: Int = 0, charset: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ") -> String {

    var len = len // for Swift 3
    if len < 1 {
      len = Int(GKRandomSource.sharedRandom().nextIntWithUpperBound(16))
    }
    var result = String()
    let charsetLength = charset.length - 1

    for _ in 0..<len {
      let randomChar = GKRandomSource.sharedRandom().nextIntWithUpperBound(charsetLength)
      if let char = charset[randomChar] {
        result = result + "\(char)"
      }
    }
    return result
  }
}
