//
//  AddExpenseView.swift
//  MyExpenseTracker
//
//  Created by Nikita on 12/05/26.
//

import Foundation
import SwiftUI

struct EditExpenseView: View {
    
    @State var title: String = ""
    @State var amount: String = ""
    @State var category: String = ""
    
    @ObservedObject var viewModel: ExpenseViewModel
    var expense: Expense
    
    @Environment(\.dismiss) var dismiss
    
    init(viewModel: ExpenseViewModel, expense: Expense) {
        self.viewModel = viewModel
        self.expense = expense
        
        _title = State(initialValue: expense.title)
        _amount = State(initialValue: String(expense.amount))
        _category = State(initialValue: expense.category)
    }
    
    var body: some View {
//        NavigationStack {
            Form {
                ExpenseFormView(title: $title, amount: $amount, category: $category)
                Button("Update Expense") {
                    guard let convertedAmount = Double(amount) else {
                        return
                    }
                    viewModel.updateExpense(expense: expense, title: title, amount: convertedAmount, category: category)
                    dismiss()
                }
            }.navigationTitle("Update Expense")
//        }
    }
}

#Preview {
    let vm = ExpenseViewModel()
    let expense = Expense(title: "Coffee", amount: 99, category: "Food")
    NavigationStack {
        EditExpenseView(viewModel: vm, expense: expense)
    }
}
