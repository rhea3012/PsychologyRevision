//
//  main.swift
//  Psychology Revision
//
//  Created by Rhea Bakrania on 15/03/2022.
//  Copyright © 2022 yes. All rights reserved.
//

import Foundation

let file = "Questions1.txt" //this is the file. we will write to and read from it

if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {

    let fileURL = dir.appendingPathComponent(file)
    

    //reading
    do {
        let Questions1 = try String(contentsOf: fileURL, encoding: .utf8)
        print(Questions1)
    }
    catch {/* error handling here */}

}

