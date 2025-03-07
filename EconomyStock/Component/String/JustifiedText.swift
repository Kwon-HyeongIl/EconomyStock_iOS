//
//  Test.swift
//  EconomyStock
//
//  Created by 권형일 on 3/7/25.
//

import SwiftUI
import WidgetKit

extension StringProtocol {
    func size(using font: UIFont) -> CGSize {
        return String(self).size(using: font)
    }
}

extension String {
    func size(using font: UIFont) -> CGSize {
        return (self as NSString).size(withAttributes: [NSAttributedString.Key.font: font])
    }
    
    func splitMultilineByCharacter(font: UIFont, maxWidth: CGFloat) -> [String] {
        guard self.size(using: font).width > maxWidth else {
            return [self]
        }
        
        var characters = Array(self).map({String($0)})
        var multiline = [characters.removeFirst()]
        var index = 0
        
        while !characters.isEmpty {
            let character = characters.removeFirst()
            
            let line = multiline[index] + character
            
            if line.size(using: font).width <= maxWidth {
                multiline[index] = line
            } else {
                multiline.append(character)
                index += 1
            }
        }
        return multiline
    }
    
    func splitMultiline(by separator: Character = " ", font: UIFont, maxWidth: CGFloat) -> [String] {
        guard self.size(using: font).width > maxWidth else {
            return [self]
        }
        
        var parts = self.split(separator: separator)
        
        var multiline = [String]()
        
        while !parts.isEmpty {
            let part = String(parts.removeFirst())
            
            let line = [multiline.last, part].compactMap({$0}).joined(separator: String(separator))
            
            if !line.isEmpty && line.size(using: font).width <= maxWidth {
                if !multiline.isEmpty {
                    multiline[multiline.endIndex - 1] = line
                } else {
                    multiline.append(line)
                }
            } else {
                let wordParts = String(part).splitMultilineByCharacter(font: font, maxWidth: maxWidth)
                multiline += wordParts
            }
        }
        return multiline.map({String($0)})
    }
    
    func justified(font: UIFont, maxWidth: CGFloat) -> String {
        let separator: Character = " "
        let hairSpace: String = "\u{200A}"

        let lines = splitMultiline(font: font, maxWidth: maxWidth)

        guard lines.count > 1 else {
            return lines.first ?? ""
        }

        let lastLine = lines.last!
        let linesExceptLast = lines.dropLast()

        let justifiedLines = linesExceptLast.map { line -> String in
            let words = line.split(separator: separator)
            guard words.count > 1 else {
                return line
            }
            
            var justifiedLine = words.joined(separator: String(hairSpace))
            var hairSpaceCount = 0
            
            while justifiedLine.size(using: font).width < maxWidth {
                hairSpaceCount += 1
                justifiedLine += hairSpace
            }
            
            hairSpaceCount -= 1
            let (minCount, extraCount) = hairSpaceCount.quotientAndRemainder(dividingBy: words.count - 1)

            let spaces = (0..<words.count).map { i in
                String(repeating: hairSpace, count: minCount) + (i < extraCount ? hairSpace : "")
            }

            return zip(words, spaces)
                .map { $0 + $1 }
                .joined()
                .trimmingCharacters(in: .whitespaces)
        }

        return (justifiedLines + [lastLine])
            .joined(separator: "\n")
    }

}

struct JustifiedText: View {
    let uiFont: UIFont = .systemFont(ofSize: 15)
    let text: String
    let maxWidth: CGFloat
    
    init(_ text: String, maxWidth: CGFloat) {
        self.text = text
        self.maxWidth = maxWidth
    }
    
    var justifiedText: String {
        text.justified(font: uiFont, maxWidth: maxWidth)
    }
    
    var body: some View {
        Text(justifiedText)
            .font(Font(uiFont))
    }
}
