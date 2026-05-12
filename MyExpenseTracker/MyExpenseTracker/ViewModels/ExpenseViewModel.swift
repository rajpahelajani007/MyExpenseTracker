//
//  ExpenseViewModel.swift
//  MyExpenseTracker
//
//  Created by Nikita on 12/05/26.
//

import UIKit
import Foundation
import Combine
import SwiftUI

class ExpenseViewModel: ObservableObject {
    
    @Published var expenses: [Expense] = [
        Expense(title: "Coffee", amount: 250, category: "Food"),
        Expense(title: "Uber", amount: 500, category: "Travel"),
        Expense(title: "Netflix", amount: 649, category: "Entertainment"),
    ]
    
    var totalExpense: Double {
        expenses.reduce(0) { partialResult, expense in
            partialResult + expense.amount
        }
    }
    
    func addExpense(title: String, amount: Double, category: String) {
        self.expenses.append(Expense(title: title, amount: amount, category: category))
    }
    
    func deleteExpense(at offsets: IndexSet) {
        self.expenses.remove(atOffsets: offsets)
        
    }
    
    func updateExpense(expense: Expense, title: String, amount: Double, category: String) {
        if let index = self.expenses.firstIndex(where: {$0.id == expense.id}) {
            self.expenses[index] = Expense(title: title, amount: amount, category: category)
        }
    }
}
