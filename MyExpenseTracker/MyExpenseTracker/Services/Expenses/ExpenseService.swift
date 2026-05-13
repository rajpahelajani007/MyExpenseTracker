//
//  ExpenseService.swift
//  MyExpenseTracker
//
//  Created by Nikita on 13/05/26.
//

import UIKit

class ExpenseService: ExpenseServiceProtocol {
    private let apiManager = APIManager()
    
    func fetchExpenses() async throws -> [Expense] {
        let posts: [Posts] = try await apiManager.request(urlString: "https://jsonplaceholder.typicode.com/posts", method: .GET, headers: [:])
        
        // Map the fetched Posts to Expense objects
        let expenses = posts.map { post in
            Expense(title: post.title, amount: Double(post.id), category: post.body)
        }
        
        return expenses
    }
    
}
