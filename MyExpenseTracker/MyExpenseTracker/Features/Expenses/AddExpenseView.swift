//
//  AddExpenseView.swift
//  MyExpenseTracker
//
//  Created by Nikita on 12/05/26.
//

import Foundation
import SwiftUI

struct AddExpenseView: View {
    
    @State var title: String = ""
    @State var amount: String = ""
    @State var category: String = ""
    
    @ObservedObject var viewModel: ExpenseViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
//        NavigationStack {
            Form {
                TextField("Please enter title", text: $title).textFieldStyle(.roundedBorder)
                TextField("Please enter amount", text: $amount).textFieldStyle(.roundedBorder).keyboardType(.decimalPad)
                TextField("Please enter category", text: $category).textFieldStyle(.roundedBorder)
                Button("Add Expense") {
                    guard let convertedAmount = Double(amount) else {
                        return
                    }
                    viewModel.addExpense(title: title, amount: convertedAmount, category: category)
                    dismiss()
                }
            }.navigationTitle("Add Expense")
//        }
    }
}

#Preview {
    let vm = ExpenseViewModel()
    NavigationStack {
        AddExpenseView(viewModel: vm)
    }
}
