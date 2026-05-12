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
            HStack {
                Text(expense.category)
                    .foregroundStyle(.gray)
                Spacer()
                Text("$ \(expense.amount, specifier: "%.2f")")
                    .fontWeight(.bold)
            }
        }.padding(.vertical, 8)
    }
}

#Preview {
    ExpenseView(expense: Expense(title: "Coffee", amount: 99, category: "Food"))
}
