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
            List {
                ForEach(viewModel.expenses) { thisExpense in
                    NavigationLink {
                        EditExpenseView(viewModel: self.viewModel, expense: thisExpense)
                    } label: {
                        ExpenseView(expense: thisExpense)
                    }
                }.onDelete { index in
                    self.viewModel.deleteExpense(at: index)
                }
                    
            }
            .toolbar {
                NavigationLink {
                    AddExpenseView(viewModel: viewModel)
                } label: {
                    Image(systemName: "plus")
                }

            }
            .navigationTitle("Expenses")
        }
    }
}

#Preview {
    ExpenseList()
}
