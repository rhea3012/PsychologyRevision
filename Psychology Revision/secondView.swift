//
//  secondView.swift
//  Psychology Revision
//
//  Created by Rhea Bakrania on 22/03/2022.
//  Copyright © 2022 yes. All rights reserved.
//

import SwiftUI


struct secondView: View {

    var questions: Question


    var body: some View {

        HStack {

            Text(questions.question)

        }

    }

}



struct secondView_Previews: PreviewProvider {

    static var previews: some View {

        secondView(questions: questions[0])

    }

}
