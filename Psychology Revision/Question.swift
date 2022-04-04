//
//  Question.swift
//  Psychology Revision
//
//  Created by Rhea Bakrania on 25/03/2022.
//  Copyright © 2022. All rights reserved.
//

struct Question: Hashable, Codable {
     let question: String
     let options: [String]
     let answer: Int
     let marksAwarded: Int
 }
