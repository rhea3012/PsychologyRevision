//
//  Question.swift
//  Psychology Revision
//
//  Created by Rhea Bakrania on 25/03/2022.
//  Copyright © 2022 yes. All rights reserved.
//

struct Question: Hashable, Codable {
     let question: String
     let answers: [String]
     let marks: Int
     let correctAnswerIndex: Int
 }
