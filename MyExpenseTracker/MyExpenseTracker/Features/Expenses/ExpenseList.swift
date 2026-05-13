//
//  ExpenseList.swift
//  MyExpenseTracker
//
//  Created by Nikita on 12/05/26.
//

import Foundation
import SwiftUI


struct ExpenseList: View {
    
    @StateObject var viewModel = ExpenseViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    ProgressView("API is loading...")
                    //                Text("API is loading...")
                    //                    .font(.title)
                    //                    .fontWeight(.bold)
                } else if let error =  viewModel.errorMessage {
                    Text("Error: \(error)")
                        .foregroundStyle(.red)
                }  else if viewModel.expenses.isEmpty {
                    
                    VStack {
                        
                        Text("No Expenses Yet")
                            .font(.title2)
                        
                        Text("Tap + to add expense")
                            .foregroundColor(.gray)
                    }
                } else {
                    Text("Total Expense: \(viewModel.totalExpense, specifier: "%.2f")")
                        .fontWeight(.bold)
                        .font(.title2)
                        .padding()
                    List {
                        ForEach(viewModel.expenses) { thisExpense in
                            NavigationLink {
                                EditExpenseView(viewModel: self.viewModel, expense: thisExpense)
                            } label: {
                                ExpenseView(expense: thisExpense)
                            }
                        }.onDelete { index in
                            self.viewModel.deleteExpense(at: index)
                        }
                        
                    }
                }
            }
            
            .toolbar {
                NavigationLink {
                    AddExpenseView(viewModel: viewModel)
                } label: {
                    Image(systemName: "plus")
                }
                
            }
            .navigationTitle("Expenses")
            .task {
                //comment this line to perform crud operations
                await viewModel.getListOfPosts()
            }
        }
    }
}

#Preview {
    ExpenseList()
}
