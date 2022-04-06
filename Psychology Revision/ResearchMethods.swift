//
//  main.swift
//  Psychology Revision
//
//  Created by Rhea Bakrania on 15/03/2022.
//  Copyright © 2022. All rights reserved.

import Foundation

enum Questions {
    static let researchMCQ: [Question] = JSONLoader.load("ResearchMCQ.json")
    static let memoryMCQ: [Question] = JSONLoader.load("MemoryMCQ.json")
    static let attachmentMCQ: [Question] = JSONLoader.load("AttachmentMCQ.json")
}

class SomeNamespace {
    var number: Int = 0
    static let otherNumber: Int = 0
}

let whatever = SomeNamespace().number
let whatever2 = SomeNamespace.otherNumber

enum JSONLoader {
    static func load<T: Decodable>(_ filename: String) -> T {
        let data: Data

        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }

        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
}
