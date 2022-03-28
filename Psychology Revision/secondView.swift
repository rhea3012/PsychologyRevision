//
//  secondView.swift
//  Psychology Revision
//
//  Created by Rhea Bakrania on 22/03/2022.
//  Copyright © 2022 yes. All rights reserved.
//

import SwiftUI



 struct secondView: View {
     
  //   @State var questions = question
     let question = questions
    
     var body: some View {

         
//Text(Questions)
         Text(questions)
         
     }
 }


 struct secondView_Previews: PreviewProvider {
    static var previews: some View {
        secondView()
    }
}
