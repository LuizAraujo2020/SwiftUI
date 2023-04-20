//
//  TransactionRow.swift
//  UIBottomSheet
//
//  Created by Luiz Araujo on 08/03/23.
//

import SwiftUI

struct TransactionRow: View {
    var title = "Groceries"
    var subtitle = "6 Transactions"
    var number = "1"
    var amount = "$364.00"
    var color = Color.blue

    var body: some View {
        HStack(spacing: 12) {
            VStack {
                Text(number).bold()
            }
            .foregroundColor(.white)
            .frame(width: 50, height: 50)
            .background(color)
            .mask {
                RoundedRectangle(cornerRadius: 30)
            }

            VStack(alignment: .leading) {
                Text(title).font(.headline)
                Text(subtitle).font(.subheadline)
                    .foregroundColor(.secondary)
            }

            Spacer()

            Text(amount)
        }
    }
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRow()
    }
}
