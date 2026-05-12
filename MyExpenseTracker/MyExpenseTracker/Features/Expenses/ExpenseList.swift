//
//  ExpenseList.swift
//  MyExpenseTracker
//
//  Created by Nikita on 12/05/26.
//

import Foundation
import SwiftUI


struct ExpenseList: View {
    
    @StateObject var viewModel = ExpenseViewModel()
    
    var body: some View {
        NavigationStack {
            Text("Total Expense: \(viewModel.totalExpense, specifier: "%.2f")")
                .fontWeight(.bold)
                .font(.title2)
                .padding()
            List(viewModel.expenses) { expense in
                ExpenseView(expense: expense)
            }
            .navigationTitle("Expenses")
        }
    }
}

#Preview {
    ExpenseList()
}
