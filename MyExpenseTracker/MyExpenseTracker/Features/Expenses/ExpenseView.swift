//
//  ExpenseView.swift
//  MyExpenseTracker
//
//  Created by Nikita on 12/05/26.
//

import Foundation
import SwiftUI

struct ExpenseView: View {
    
    var expense: Expense
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(expense.title)
                .font(.headline)
            Text(expense.category)
                .foregroundStyle(.gray)
            Text("$ \(expense.amount, specifier: "%.2f")")
                .fontWeight(.bold)
        }.padding(.vertical, 8)
    }
}
