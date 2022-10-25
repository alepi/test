//
//  regex.swift
//  Minicron
//
//  Created by YAWMOO Limited on 25/10/2022.
//  Copyright © 2022 Alessandro Pistocchi. All rights reserved.
//

import Foundation

struct RegExStrings {
    static let white = "\\s"
    static let number2Digits = "[0-9][0-9]"
    static let HHMM = makeBeginToEnd(pattern:"[0-9][0-9]:[0-9][0-9]")
    static let numberOrStar = "([*]|([0-9]+))"
    static let validFilenameCharacters = "[0-9a-zA-Z_.]|(\\[ ])||-" // filenames in reality may contain more characters
    static let pathComponent = "\\/(\(validFilenameCharacters))+" // paths must start at the root of the file system, this is reasonable as otherwise minicron would not know where they are
    static let command = "(\(pathComponent))+"
    static let configLine = makeBeginToEnd(pattern: "\(RegExStrings.white)*\(RegExStrings.numberOrStar)\(RegExStrings.white)+\(RegExStrings.numberOrStar)\(RegExStrings.white)+\(RegExStrings.command)\(RegExStrings.white)*")
    
    static func makeBeginToEnd(pattern: String) -> String { "^\(pattern)$" }
}

extension NSRegularExpression {
    static let white : NSRegularExpression = { try! NSRegularExpression(pattern: RegExStrings.white, options: []) }()
    static let number2Digits = { try! NSRegularExpression(pattern: RegExStrings.number2Digits, options: []) }()
    static let HHMM = { try! NSRegularExpression(pattern: RegExStrings.HHMM, options: []) }()
    static let numberOrStar : NSRegularExpression = { try! NSRegularExpression(pattern: RegExStrings.numberOrStar, options: []) }()
    static let validFilenameCharacters : NSRegularExpression = { try! NSRegularExpression(pattern: RegExStrings.validFilenameCharacters, options: []) }()
    static let pathComponent : NSRegularExpression = { try! NSRegularExpression(pattern: RegExStrings.pathComponent, options: []) }()
    static let command : NSRegularExpression = { try! NSRegularExpression(pattern: RegExStrings.command, options: []) }()
    static let configLine : NSRegularExpression = { try! NSRegularExpression(pattern: RegExStrings.configLine, options: []) }()
}

extension NSRegularExpression {
    
    static func makeBeginToEnd(pattern: String) throws -> NSRegularExpression { try NSRegularExpression(pattern: "^\(pattern)$", options: []) }

    func matchesFully(string s: String) -> Bool {
        let range = NSRange(s.startIndex..<s.endIndex, in: s)
        let matches = self.matches(in: s, options: .anchored, range: range)
        guard let r = matches.first?.range, let firstMatchRange = Range(r, in: s) else { return false }
        let matchedString = String(s[firstMatchRange])
        return matchedString == s
    }
    
    func matchedValues(string s: String) -> [String] {
        var result: [String] = []
        let range = NSRange(s.startIndex..<s.endIndex, in: s)
        let matches = self.matches(in: s, options: [], range: range)
        for match in matches {
            let range = Range(match.range, in: s)! // Range() does not return nil because the match exists, so it has to have a valid range. Thus I can use ! safely
            result.append(String(s[range]))
        }
        return result
    }
    
}
