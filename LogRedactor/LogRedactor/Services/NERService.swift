//
//  NERService.swift
//  LogRedactor
//
//  Created by Saurabh Verma on 12/02/26.
//

import NaturalLanguage

final class NERService {

    func detectPII(in text: String) -> [Range<String.Index>] {

        var ranges: [Range<String.Index>] = []

        let tagger = NLTagger(tagSchemes: [.nameType])
        tagger.string = text

        let fullRange = text.startIndex..<text.endIndex

        tagger.enumerateTags(in: fullRange,
                             unit: .word,
                             scheme: .nameType,
                             options: [.omitWhitespace, .omitPunctuation]) { tag, range in

            if tag == .personalName ||
               tag == .organizationName ||
               tag == .placeName {

                ranges.append(range)
            }
            return true
        }

        // Add regex for emails
        let emailPattern = #"\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b"#
        if let regex = try? NSRegularExpression(pattern: emailPattern,
                                                options: .caseInsensitive) {
            let matches = regex.matches(in: text,
                                        range: NSRange(text.startIndex..., in: text))

            for match in matches {
                if let range = Range(match.range, in: text) {
                    ranges.append(range)
                }
            }
        }

        return ranges
    }
}
