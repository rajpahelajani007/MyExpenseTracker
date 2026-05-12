//
//  ExpenseViewModel.swift
//  MyExpenseTracker
//
//  Created by Nikita on 12/05/26.
//

import UIKit
import Foundation
import Combine

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
}
