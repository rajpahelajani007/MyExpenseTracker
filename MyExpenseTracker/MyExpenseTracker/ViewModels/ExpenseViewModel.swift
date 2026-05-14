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

@MainActor
class ExpenseViewModel: ObservableObject {
    
    @Published var expenses: [Expense] = [
        Expense(title: "Coffee", amount: 250, category: "Food"),
        Expense(title: "Uber", amount: 500, category: "Travel"),
        Expense(title: "Netflix", amount: 649, category: "Entertainment"),
    ]
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    var totalExpense: Double {
        expenses.reduce(0) { partialResult, expense in
            partialResult + expense.amount
        }
    }
    
    private let service: ExpenseServiceProtocol
    
    init() {
        self.service = ExpenseService()
    }
    
    // Injected init
    
    init(service: ExpenseServiceProtocol) {
        self.service = service
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
    
    func getListOfExpenses() async {
        
        isLoading = true
        errorMessage = nil
        
        do {
            self.expenses = try await service.fetchExpenses()
//            let thisArray: [Posts] = try await service.request(urlString: "https://jsonplaceholder.typicode.com/posts", method: .GET, headers: [:])
//            self.expenses.removeAll()
//            for thisPost in thisArray {
//                let thisExpense = Expense(title: thisPost.title, amount: Double(thisPost.id), category: thisPost.body)
//                self.expenses.append(thisExpense)
//            }
        } catch let error {
            errorMessage = error.localizedDescription
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
            self.isLoading = false
        })
    }
    
    func retryAPICall() async {
        await self.getListOfExpenses()
    }
}
