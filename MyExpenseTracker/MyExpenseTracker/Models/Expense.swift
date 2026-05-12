//
//  ExpenseModel.swift
//  MyExpenseTracker
//
//  Created by Nikita on 12/05/26.
//

import UIKit
import Foundation

struct Expense: Decodable, Identifiable {
    
    var id = UUID()
    var title: String
    var amount: Double
    var category: String
}
