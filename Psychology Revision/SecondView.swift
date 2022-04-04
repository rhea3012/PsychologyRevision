//
//  SecondView.swift
//  Psychology Revision
//
//  Created by Rhea Bakrania on 22/03/2022.
//  Copyright © 2022. All rights reserved.
//

import SwiftUI
struct SecondView: View {

let researchMCQ: [Question]
    
    
//Creating Variables for Revision Topics
    @State private var setOptionOne = false
    @State private var setOptionTwo = false
    @State private var setOptionThree = false
        
    @State private var questionIndex = 0
    
    let button = ["Confirm Answer"]
    @State public var buttonConfirm = [Int?]()
    
//User Home Page View
            var body: some View {
                
//Allows for Scrolling
            ScrollView{
                
//App Logo and Vertical Stacks
                VStack(spacing: 1.0) {
                    
//Multiple Choice Question Appears
//Used Group{} to Prevent Argument Error
        Group {
            Text(researchMCQ[questionIndex].question)
                .padding(.top, 20)
                .padding(.trailing, 5)
        
        Spacer()
        Spacer()
        Spacer()
        
//Ensures Only One Answer Can Be Selected
            let OptionOne = Binding<Bool>(get: { self.setOptionOne }, set: { self.setOptionOne = $0; self.setOptionTwo = false; self.setOptionThree = false })
            let OptionTwo = Binding<Bool>(get: { self.setOptionTwo }, set: { self.setOptionOne = false; self.setOptionTwo = $0; self.setOptionThree = false })
            let OptionThree = Binding<Bool>(get: { self.setOptionThree }, set: { self.setOptionOne = false; self.setOptionTwo = false; self.setOptionThree = $0 })

//Shows User MCQ Options
            VStack {
                Toggle(researchMCQ[questionIndex].options[0], isOn: OptionOne)
                    .toggleStyle(.button)
                    .tint(Color(red: 0.8, green: 0.8, blue: 0.8))
                    .foregroundColor(Color("Black-White"))
                Toggle(researchMCQ[questionIndex].options[1], isOn: OptionTwo)
                    .toggleStyle(.button)
                    .tint(Color(red: 0.8, green: 0.8, blue: 0.8))
                    .foregroundColor(Color("Black-White"))
                Toggle(researchMCQ[questionIndex].options[2], isOn: OptionThree)
                    .toggleStyle(.button)
                    .tint(Color(red: 0.8, green: 0.8, blue: 0.8))
                    .foregroundColor(Color("Black-White"))
                     }
        }
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    HStack(spacing: 15) {
                    ForEach(0..<button.count, id: \.self) {button in
                        Button {
                            buttonConfirm[questionIndex] = button

                            // Make sure the index doesn't go beyond the array size
                            if researchMCQ.count > questionIndex + 1 {
                                questionIndex += 1
                            }
                        } label: {
                            Text("Confirm Answer")
                        }
                                
                        .padding(.vertical, 12.5)
                        .padding(.horizontal, 120)
                        .foregroundColor(.white)
                        .foregroundStyle(.background)
                        .background(2 == button ? Color.primary: Color.secondary)
                        .clipShape(Capsule())
                        
                        
                    }
                    
                    
            }
        }
    }
                
//Allows Header To Be Displayed
       .navigationTitle("Research Methods Year 1 & 2")
       .navigationBarBackButtonHidden(true)
       .navigationBarTitleDisplayMode(.inline)
       
                
            }
    
}

            


struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(researchMCQ: [])

    }

}
    
