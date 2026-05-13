//
//  ExpenseServiceProtocol.swift
//  MyExpenseTracker
//
//  Created by Nikita on 13/05/26.
//

import UIKit
import Foundation

protocol ExpenseServiceProtocol {
    func fetchExpenses() async throws -> [Expense]
}
