//
//  DashboardScreeen.swift
//  MyExpenseTracker
//
//  Created by Nikita on 07/05/26.
//

import SwiftUI

struct DashboardScreeen: View {
    var body: some View {
        VStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundStyle(.blue)
            Text("Raj Pahelajani")
                .font(.title)
                .fontWeight(.bold)
            HStack(spacing: 4) {
                Text("9+")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                Text("Years")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundStyle(.black)
            }
            Button {
                print("View Profile Tapped!")
            } label: {
                VStack {
                    Text("View Profile")
                        .fontWeight(.medium)
                        .foregroundStyle(.white)
                        .padding(8)
                }.background(.purple)
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity)
            }

        }
    }
}

#Preview {
    DashboardScreeen()
}
