//
//  MockExpenseService.swift
//  MyExpenseTracker
//
//  Created by Nikita on 13/05/26.
//

import UIKit

class MockExpenseService: ExpenseServiceProtocol {
    func fetchExpenses() async throws -> [Expense] {
        let thisArrayExpense: [Expense] = [
            Expense(title: "Coffee", amount: 99, category: "Food"),
            Expense(title: "Movie", amount: 399, category: "Entertainment"),
            Expense(title: "Popcorn", amount: 199, category: "Food"),
        ]
        return thisArrayExpense
    }

}
