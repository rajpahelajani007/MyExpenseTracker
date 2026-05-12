//
//  CounterScreen.swift
//  MyExpenseTracker
//
//  Created by Nikita on 10/05/26.
//

import UIKit
import SwiftUI

struct CounterScreen: View {
    
    @StateObject var objectModel = CounterScreenViewModel()
    
    var body: some View {
        ZStack {
            Color(self.objectModel.isDarkMode ? .red : .orange)
                .ignoresSafeArea()
            VStack(spacing: 12) {
                HStack(spacing: 10) {
                    Button {
                        if self.objectModel.counterValue != 0 {
                            self.objectModel.counterValue -= 1
                        }
                    } label: {
                        Text("-")
                            .frame(width: 25, height: 25)
                            .fontWeight(.bold)
                            .font(.title2)
                            .background(.white)
                    }
                    Text("\(self.objectModel.counterValue)")
                        .fontWeight(.bold)
                        .font(.title3)
                        .foregroundStyle(.white)
                    Button {
                        print("Increment Value")
                        self.objectModel.counterValue += 1
                    } label: {
                        Text("+")
                            .frame(width: 25, height: 25)
                            .fontWeight(.bold)
                            .font(.title2)
                            .background(.white)
                    }
                }
                
                ResetButton(objectModel: self.objectModel)

                TextField("Enter you name", text: self.$objectModel.name)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 12)
                    .padding(.top, 12)
                    .onChange(of: self.objectModel.name) { oldValue, newValue in
                        if newValue.count > 5 {
                            self.objectModel.showAlert = true
                            self.objectModel.name = String(newValue.prefix(5))
                        }
                    }
                Text("Name count: \(self.objectModel.name.count)")
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                Toggle(isOn: self.$objectModel.isDarkMode) {
                    Text("Dark Mode")
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                }
                    .labelsHidden()
            }.alert("Error", isPresented: self.$objectModel.showAlert) {
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
struct ResetButton: View {
    
    @ObservedObject var objectModel: CounterScreenViewModel
    
    var body: some View {
        Button {
            self.objectModel.name = ""
            self.objectModel.counterValue = 0
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
    }
}
