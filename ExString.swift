import Foundation

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

}
