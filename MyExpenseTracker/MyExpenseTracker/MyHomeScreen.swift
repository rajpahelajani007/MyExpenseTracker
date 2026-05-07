//
//  MyHomeScreen.swift
//  MyExpenseTracker
//
//  Created by Nikita on 07/05/26.
//

import SwiftUI

struct MyHomeScreen: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Hello Raj!")
                .background(.green)
                .font(.title)
            Text("Hello World!")
                .background(.red)
                .font(.title2)
        }
        .background(.cyan)
        .padding()
    }
}
#Preview {
    MyHomeScreen()
}
