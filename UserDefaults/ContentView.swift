//
//  ContentView.swift
//  UserDefaults
//
//  Created by Daniel O'Leary on 3/3/20.
//  Copyright © 2020 Impulse Coupled Development. All rights reserved.
//

import SwiftUI


struct ContentView: View {
	@State private var isBirthday = false
	@State private var age = ""
	@State private var name = ""
	
	private let defaults = UserDefaults.standard
	
	var body: some View {
		VStack {
			Spacer()
			TextField("Enter your name", text: $name)
			TextField("Enter your age.", text: $age)
			Toggle(isOn: $isBirthday) {
				Text("Is it your birthday?")
			}.padding()
			Spacer()
			
			Text("\(name)")
			Text("\(age)")
			Text(isBirthday ? "Happy Birthday!" : "Hello \(name)")
			Spacer()
			HStack {
				Button("Save") {
					self.save()
				}
				.padding(30)
				.border(Color.blue)
				
				Button("Load") {
					self.load()
				}
				.padding(30)
				.border(Color.green)
				
			}
		}
			// uncomment to load saved values when app launches.
//		.onAppear(perform: load)
		.textFieldStyle(RoundedBorderTextFieldStyle())
	}
	
	func save() {
		defaults.set(isBirthday, forKey: "birthday")
		defaults.set(age, forKey: "age")
		defaults.set(name, forKey: "name")
	}
	
	func load() {
		let savedName = defaults.string(forKey: "name")
		let savedAge = defaults.string(forKey: "age")
		let savedBirthday = defaults.bool(forKey: "birthday")
		
		isBirthday = savedBirthday
		// Using nil coalescing operator to account for optional values but there are other ways of handling this.
		age = savedAge ?? "no age saved"
		name = savedName ?? "no name saved"
	}
}



struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
