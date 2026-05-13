//
//  MyExpenseTrackerApp.swift
//  MyExpenseTracker
//
//  Created by Nikita on 07/05/26.
//

import SwiftUI

@main
struct MyExpenseTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ExpenseList(viewModel: ExpenseViewModel())
//            CounterScreen()
//            MyHomeScreen()
        }
    }
}
