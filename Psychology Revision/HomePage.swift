//
//  ContentView.swift
//  Psychology Revision
//
//  Created by Rhea Bakrania on 03/03/2022.
//  Copyright © 2022 yes. All rights reserved.
// test

import SwiftUI
struct ContentView: View {
	
//Creating Variables for Revision Topics
	@State private var setMemory = false
	@State private var setSocialInfluence = false
	@State private var setApproaches = false
	@State private var setPsychopathology = false
	@State private var setBiopsychology = false
	@State private var setAttachment = false
	@State private var setIssuesandDebates = false
	@State private var setSchizophrenia = false
	@State private var setResearchMethods = false
	
//Creating Buttons for Number of Questions
			let buttons = ["10", "20", "30", "40", "50"]
	@State public var NumberSelected: Int?
	
//Creating Variable for 'How To Use' Instructions
	@State private var HowToUse = """
1. Select your revision topics
2. Choose how many questions you are able to answer
3. Click the 'continue' button and start revising!
"""
	@State private var HowToUse2 = """
Multiple choice questions will appear first. Once you have a score of 5 or over, the difficulty will increase to short-answer questions. If you master these and achieve a score of 25 or above, long-answer questions will appear.
"""
	@State private var HowToUse3 = """
All multiple choice questions will be automatically marked. For the harder questions, a student-friendly markscheme will show and you will need to input your score. Be honest!
"""

//Creating Variables for 'Continue' Button
	let button = ["Continue"]
    @State public var buttonContinue: Int?
	
//Making Sure User Selects Topic(s) and Number of Questions
	private var allTopics: [Bool] {
	   [setMemory, setSocialInfluence, setApproaches, setPsychopathology, setBiopsychology, setAttachment, setIssuesandDebates, setSchizophrenia, setResearchMethods]}

   private var TopicSelected: Bool {
	   allTopics.contains { $0 }}

   private var isFormValid: Bool {
	   TopicSelected && NumberSelected != nil}
	
//User Home Page View
	var body: some View {
		
//Allows for Navigation and Scrolling
		NavigationView {
		ScrollView{
			
//App Logo and Vertical Stacks
			VStack(spacing: 1.0) {
			HStack {
			Image("AppLogo")
					.resizable()
					.scaledToFit()
					.padding(.trailing, 50.0)
				.frame(height: 100, alignment: .topLeading)
				
			}
			
//'Topics to Revise' Header and Horizontal Stacks
			HStack {
			Text("A-Level Topics")
					.font(.title2)
				.fontWeight(.medium)
				.foregroundColor(Color("Black-White"))
			//	.lineLimit(nil)
				.padding(.top, -20.0)
				.frame(width: 161, height: 10, alignment: .topLeading)
				.padding(.trailing, 198.0)
				
				Text("Click to Revise")
					.foregroundColor(Color("Black-White"))
					.padding(.leading, -368.0)
					.padding(.top, 30.0)
					.padding(.bottom, 10.0)
			}
			
//Toggles for Topics and Vertical Stacks
//Used Group{} to Prevent Argument Error
				Group{
					VStack(alignment: .leading, spacing: 5) {
				Toggle("Memory",isOn: $setMemory)
					.toggleStyle(.button)
					.tint(Color(red: 0.902, green: 0.755, blue: 0.161))
				Toggle("Approaches",isOn: $setApproaches)
					.toggleStyle(.button)
					.tint(Color(red: 0.945, green: 0.442, blue: 0.022))
				Toggle("Biopsychology",isOn: $setBiopsychology)
					.toggleStyle(.button)
					.tint(Color(red: 0.817, green: 0.065, blue: 0.287))
					
				Toggle("Issues & Debates",isOn: $setIssuesandDebates)
					.toggleStyle(.button)
					.tint(Color(red: 0.399, green: 0.06, blue: 0.947))
				Toggle("Research Methods Year 1 & 2",isOn: $setResearchMethods)
					.toggleStyle(.button)
						.tint(Color(red: 0.105, green: 0.561, blue: 0.896))}
					.padding(.leading, -135.0)
					.padding(.top, -10)
					
			VStack(alignment: .leading, spacing: 5) {
				Toggle("Social Influence",isOn: $setSocialInfluence)
					.toggleStyle(.button)
					.tint(Color(red: 0.902, green: 0.755, blue: 0.17))
				Toggle("Psychopathology",isOn: $setPsychopathology)
					.toggleStyle(.button)
					.tint(Color(red: 0.945, green: 0.442, blue: 0.022))
				Toggle("Attachment",isOn: $setAttachment)
					.toggleStyle(.button)
					.tint(Color(red: 0.817, green: 0.065, blue: 0.287))
				Toggle("Schizophrenia",isOn: $setSchizophrenia)
					.toggleStyle(.button)
				.tint(Color(red: 0.394, green: 0.061, blue: 0.943))}
					.padding(.top, -192)
					.padding(.leading, 180)
		}
			
			Spacer()
			
//'Number of Questions' Header
			Group{
			Text("Number of Questions")
				.font(.title2)
				.fontWeight(.medium)
				.foregroundColor(Color("Black-White"))
				.padding(.trailing, 161.0)
			
			Spacer()
			
	
//Number of Questions - Selected Buttons
			HStack(spacing: 15) {
				ForEach(0..<buttons.count, id: \.self) {button in
					Button(action: {
						self.NumberSelected = button
						
					}) {
						Text("\(self.buttons[button])")
							.foregroundColor(Color("Black-White"))
							.font(.title3)
							.padding()
							.background(self.NumberSelected == button ? Color(.gray): Color("White-Black"))
						.clipShape(Capsule())}}
				
				}
				
			}
		}
			
			Spacer()
			
//'How To Use' Header
			VStack(alignment: .leading) {
			Text("How To Use")
				 .font(.title2)
				 .fontWeight(.medium)
				 .foregroundColor(Color("Black-White"))
				 .padding(.leading, 10)
				 

//How To Use Instructions
				Text(HowToUse)
					.foregroundColor(Color("Black-White"))
			 .fixedSize(horizontal: false, vertical: true)
			 .font(.subheadline)
			 .padding(.leading, 10)
			  
			  Spacer()
			  
				Text(HowToUse2)
					.foregroundColor(Color("Black-White"))
				  .fixedSize(horizontal: false, vertical: true)
				  .font(.subheadline)
				  .padding(.bottom, -6)
				  .padding(.leading, 10)
			  
				Text(HowToUse3)
					.foregroundColor(Color("Black-White"))
				  .fixedSize(horizontal: false, vertical: true)
				  .font(.subheadline)
				.padding(.leading, 10)}
			
			Spacer()
			
			HStack(spacing: 15) {
			ForEach(0..<button.count, id: \.self) {button in
					Button(action: {
						self.buttonContinue = button
						
					}) {
						
//Links Conitinue Button To Next Page
						NavigationLink(destination: secondView()) {
							Text("Continue")
						}
						
						.padding(.vertical, 12.5)
						.padding(.horizontal, 120)
						.foregroundColor(.white)
						.foregroundStyle(.background)
						.background(2 == button ? Color.primary: Color.secondary)
						
//'Continue' Button is Disabled if User Has Not Selected Values
						.clipShape(Capsule())}}.disabled(!isFormValid)
				
				
				
			}
			
			Spacer()
				
		}
		
//Allows Navigate Through Pages
		.navigationTitle("")
		.padding(.top, -100)
			
		}
	}
		
	
struct Previews_ContentView_Previews: PreviewProvider {
	static var previews: some View {
			ContentView()
		
	}
}

}
