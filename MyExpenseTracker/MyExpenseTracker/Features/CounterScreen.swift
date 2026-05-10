//
//  CounterScreen.swift
//  MyExpenseTracker
//
//  Created by Nikita on 10/05/26.
//

import UIKit
import SwiftUI

struct CounterScreen: View {
    
    @State var counterValue: Int = 0
    @State var name: String = ""
    @State var showAlert: Bool = false
    @State var isDarkMode: Bool = false
    
    var body: some View {
        ZStack {
            Color(isDarkMode ? .red : .orange)
                .ignoresSafeArea()
            VStack(spacing: 12) {
                HStack(spacing: 10) {
                    Button {
                        if counterValue != 0 {
                            counterValue -= 1
                        }
                    } label: {
                        Text("-")
                            .frame(width: 25, height: 25)
                            .fontWeight(.bold)
                            .font(.title2)
                            .background(.white)
                    }
                    Text("\(counterValue)")
                        .fontWeight(.bold)
                        .font(.title3)
                        .foregroundStyle(.white)
                    Button {
                        print("Increment Value")
                        counterValue += 1
                    } label: {
                        Text("+")
                            .frame(width: 25, height: 25)
                            .fontWeight(.bold)
                            .font(.title2)
                            .background(.white)
                    }
                }
                Button {
                    name = ""
                    counterValue = 0
                } label: {
//                    ZStack {
//                        Color(.blue)
                        Text("Reset")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .font(.title3)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 8)
                            .background(Color.blue)
                            .cornerRadius(10)
                        
//                    }
                }

                TextField("Enter you name", text: $name)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 12)
                    .padding(.top, 12)
                    .onChange(of: name) { oldValue, newValue in
                        if newValue.count > 5 {
                            showAlert = true
                            name = String(newValue.prefix(5))
                        }
                    }
                Text("Name count: \(name.count)")
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                Toggle(isOn: $isDarkMode) {
                    Text("Dark Mode")
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                }
                    .labelsHidden()
            }.alert("Error", isPresented: $showAlert) {
                Button("Okay!", role: .destructive) {
                    print("Destructive!")
                }
            } message: {
                Text("You can't enter more than 5 letters")
            }
        }
    }
}
#Preview {
    CounterScreen()
}
