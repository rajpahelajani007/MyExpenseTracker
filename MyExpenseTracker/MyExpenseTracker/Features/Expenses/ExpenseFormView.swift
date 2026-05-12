//
//  ExpenseFormView.swift
//  MyExpenseTracker
//
//  Created by Nikita on 12/05/26.
//

import Foundation
import SwiftUI



struct ExpenseFormView: View {
    
    @Binding var title: String
    @Binding var amount: String
    @Binding var category: String
    
    var body: some View {
        Section("Expense Details") {
            TextField("Please enter title", text: $title).textFieldStyle(.roundedBorder)
            TextField("Please enter amount", text: $amount).textFieldStyle(.roundedBorder).keyboardType(.decimalPad)
            TextField("Please enter category", text: $category).textFieldStyle(.roundedBorder)
        }
    }
}

#Preview {
    @Previewable @State var title = "Coffee"
    @Previewable @State var amount = "120"
    @Previewable @State var category = "Food"

    return ExpenseFormView(
        title: $title,
        amount: $amount,
        category: $category
    )
}
