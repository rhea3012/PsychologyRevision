//
//  ContentView.swift
//  Psychology Revision
//
//  Created by Rhea Bakrania on 03/03/2022.
//  Copyright © 2022. All rights reserved.

import SwiftUI

struct ToggleableItem {
	let title: String
	var isOn: Bool
	let color: Color
}

struct TogglableView: View {
	@Binding var storage: [Bool]

	var tag: Int
	var title: String = ""
	var color: Color

	var body: some View {
		let isSelected = Binding(
			get: { self.storage[self.tag] },
			set: { value in
				withAnimation {
					self.storage = self.storage.enumerated().map { $0.0 == self.tag }
				}
			}
		)
		return Toggle(self.title, isOn: isSelected)
			.toggleStyle(.button)
			.tint(color)
	}
}

struct ContentView: View {

	@State var topics = [
		"Memory",
		"Approaches",
		"Biopsychology",
		"Issues & Debates",
		"Research Methods Year 1 & 2",
		"Social Influence",
		"Pychopathology",
		"Attachment",
		"Schizophrenia"
	]

	@State var flags = Array(repeating: false, count: 9)

	@State var colors: [Color] = [
		Color(red: 0.902, green: 0.755, blue: 0.161),
		Color(red: 0.902, green: 0.755, blue: 0.161),
		Color(red: 0.902, green: 0.755, blue: 0.161),
		Color(red: 0.902, green: 0.755, blue: 0.161),
		Color(red: 0.902, green: 0.755, blue: 0.161),
		Color(red: 0.902, green: 0.755, blue: 0.161),
		Color(red: 0.902, green: 0.755, blue: 0.161),
		Color(red: 0.902, green: 0.755, blue: 0.161),
		Color(red: 0.902, green: 0.755, blue: 0.161),
		Color(red: 0.902, green: 0.755, blue: 0.161),
		Color(red: 0.902, green: 0.755, blue: 0.161)
	]

	var selectedTopic: String {
		guard let index = flags.firstIndex(where: { $0 == true }) else { return "" }
		return self.topics[index]
	}

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
	//	@State private var oneClicked = false

	@State var nextDestination: AnyView?

	//Creating Buttons for Number of Questions
	let buttons = ["10", "20", "30", "40", "50"]
	@State public var NumberSelected: Int?
	
	//Creating Variable for 'How To Use' Instructions
	@State private var HowToUse = """
1. Select your revision topic
2. Choose how many questions you are able to answer
3. Click the 'continue' button below and start revising!
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
					Image("AppLogo")
						.resizable()
						.scaledToFit()
						.padding(.trailing, 50.0)
						.frame(height: 100, alignment: .topLeading)

					//'Topics to Revise' Header and Horizontal Stacks
					HStack {
						Text("A-Level Topics")
							.font(.title2)
							.fontWeight(.medium)
							.foregroundColor(Color("Black-White"))
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
					VStack(alignment: .leading) {
						ForEach(self.flags.indices) { index in
							TogglableView(storage: self.$flags, tag: index, title: self.topics[index], color: self.colors[index])
						}

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
										.background(self.NumberSelected == button ? Color("Custom Gray"): Color("White-Black"))
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

							switch selectedTopic {
							case "Memory":
								nextDestination =  SecondView(researchMCQ: [])
							case "Approaches":

							case "Biopsychology":

							case "Issues & Debates":

							case "Research Methods Year 1 & 2":

							case "Social Influence":

							case "Pychopathology":

							case "Attachment":

							case "Schizophrenia":
							}
							//Links Continue Button To Next Page
							NavigationLink(destination: nextDestination) {
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

			//Allows Navigation Through Pages
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
