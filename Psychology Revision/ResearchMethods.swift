//
//  main.swift
//  Psychology Revision
//
//  Created by Rhea Bakrania on 15/03/2022.
//  Copyright © 2022 yes. All rights reserved.
// test
//test

import Foundation

enum QuestionPackError: Error {
     case invalidURL
 }

 func readQuestionPack() throws -> QuestionPack {


     guard let url = Bundle.main.url(forResource: "questions", withExtension: "json") else {
             throw QuestionPackError.invalidURL
         }

     let data = try Data(contentsOf: url)
          return try JSONDecoder().decode(QuestionPack.self, from: data)
      }
