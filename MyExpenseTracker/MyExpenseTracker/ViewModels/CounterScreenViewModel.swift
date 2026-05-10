//
//  CounterScreenViewModel.swift
//  MyExpenseTracker
//
//  Created by Nikita on 10/05/26.
//

import Foundation
import SwiftUI
import Combine

class CounterScreenViewModel: ObservableObject {
    
    @Published var counterValue: Int = 0
    @Published var name: String = ""
    @Published var showAlert: Bool = false
    @Published var isDarkMode: Bool = false
    
    func increaseCounter() {
        self.counterValue += 1
    }
    
    func decreaseCounter() {
        self.counterValue -= 1
    }
    
    func resetData() {
        self.counterValue = 0
        self.name = ""
    }
    
    func switchDarkMode() {
        self.isDarkMode = !self.isDarkMode
    }
}
