//
//  MyHomeScreen.swift
//  MyExpenseTracker
//
//  Created by Nikita on 07/05/26.
//

import SwiftUI

struct MyHomeScreen: View {
    var body: some View {
        ZStack {
            Color(.blue)
                .ignoresSafeArea()

            VStack(spacing: 10) {
                Image(systemName: "heart.fill")
                    .foregroundStyle(.red)
                Group {
                    Text("Hello Raj!")
                        .background(.green)
                        .font(.title)
                    Text("Hello World!")
                        .background(.yellow)
                        .font(.title3)
                }
                HStack(spacing: 10) {
                    Text("Hello Raj!")
                        .background(.green)
                        .font(.title)
                    Text("Hello World!")
                        .background(.yellow)
                        .font(.title3)
                }
            }
            .background(.white)
            .padding()
            
        }
    }
}
#Preview {
    MyHomeScreen()
}
