//
//  BottomSheetContentView.swift
//  UIBottomSheet
//
//  Created by Luiz Araujo on 08/03/23.
//

import SwiftUI

struct BottomSheetContentView: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 3,style: .continuous)
                .frame(width: 40, height: 5)
                .padding(8)

            HStack(spacing: 16) {
                Text("Cards").font(.largeTitle).bold()
                Button {} label: {
                    Label("Add", systemImage: "plus.circle.fill")
                        .font(.body.bold())
                        .foregroundColor(.white)
                        .padding(8)
                        .padding(.horizontal, 8)
                }
                .background(Color(UIColor(.accentColor)))
                .cornerRadius(30)

                Spacer()
            }
                .padding(24)

            HStack {
                CardView(title: "Apple", x: -100, y: 100)
                    .frame(width: 140, height: 200)

                Spacer()

                CardView(title: "Apple", x: -100, y: 100)
                    .frame(width: 140, height: 200)
            }
            .padding(24)
            .background(Color(UIColor(hex: "EDF2FF")))

            Text("Transaction")
                .font(.title2).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(24)

            VStack {
                TransactionRow(title: "Groceries", subtitle: "3 transactions", number: "1", amount: "364.00", color: .blue)
                TransactionRow(title: "Entertainment", subtitle: "6 transactions", number: "2", amount: "952.00", color: .indigo)
                TransactionRow(title: "Restaurants", subtitle: "12 transactions", number: "3", amount: "602.00", color: .pink)
            }
            .padding(24)

            Spacer()
        }
    }
}

struct BottomSheetContentView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetContentView()
    }
}

extension UIColor {
    public convenience init(hex:String) {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        if ((cString.count) == 8) {
            r = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
            g =  CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
            b = CGFloat((rgbValue & 0x0000FF)) / 255.0
            a = CGFloat((rgbValue & 0xFF000000)  >> 24) / 255.0

        }else if ((cString.count) == 6){
            r = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
            g =  CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
            b = CGFloat((rgbValue & 0x0000FF)) / 255.0
            a =  CGFloat(1.0)
        }


        self.init(  red: r,
                    green: g,
                    blue: b,
                    alpha: a
        )
    } }
