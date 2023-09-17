//
//  LineChartView.swift
//  EstatisticaDescritiva
//
//  Created by Luiz Araujo on 27/08/23.
//

import SwiftUI

struct LineChartView: View {
    var vm = MainViewModel()
    let widthLine = 40.0
    let lineWidth = 2.0

    var body: some View {
        ZStack {
            Color.gray
            VStack {
                GeometryReader { geo in
                    ScrollView(.horizontal) {
                        VStack {
                            ZStack {
                                Group {
                                    LineVerticalCustom(height: geo.size.height, data: vm.data, widthLine: widthLine)
                                        .stroke(lineWidth: lineWidth)
                                        .fill(.gray.opacity(0.3))

                                    LineHorizontalCustom(height: geo.size.height, data: vm.data, widthLine: widthLine)
                                        .stroke(lineWidth: lineWidth)
                                        .fill(.black.opacity(0.3))
                                }
                                .frame(width: CGFloat(vm.data.count) * widthLine,
                                       height: geo.size.height)

                                LineChartCustom(height: geo.size.height, data: vm.data, widthLine: widthLine, maximum: vm.maxNumber().dB, minimum: vm.minNumber().dB)
                                    .stroke(lineWidth: lineWidth)
                                    .fill(.blue)
                                    .frame(width: CGFloat(vm.data.count) * widthLine,
                                           height: geo.size.height)
                            }
                        }


                        //                Text("asdasda")
//                        HStack {
                            ForEach(vm.data) { db in
                                Text("\(db.dB)")//.rotationEffect(Angle(degrees: 90))
                                    .padding(.trailing)
                                    .foregroundColor(.blue)
                            }
//                        }
                        //                    createLabel()
                    }
                }
            }
            .background(.white)
        }.ignoresSafeArea()
    }

    @ViewBuilder
    private func createLabel() -> some View {
        HStack {
            ForEach(vm.data) { db in
                Text("\(db.dB)")//.rotationEffect(Angle(degrees: 90))
                    .padding(.trailing)
            }
        }
    }
}

struct LineChartCustom: Shape {
    var height: CGFloat
    var data = [Datum]()
    var widthLine: CGFloat
    let maximum: Double
    let minimum: Double

    func path(in rect: CGRect) -> Path {
        var posX: Double = widthLine
        var path = Path()

        path.move(to: CGPoint(x: posX, y: getPercentage(data[0].dB) * height))

        for index in 1..<data.count {
            posX += widthLine
            path.addLine(to: CGPoint(x: posX, y: getPercentage(data[index].dB) * height))
        }

        return path
    }

    private func getPercentage(_ value: Double) -> Double {
        let amplitude = maximum - minimum
        return (value - minimum) / amplitude
    }
}

struct LineVerticalCustom: Shape {
    var height: CGFloat
    var data = [Datum]()
    var widthLine: CGFloat

    func path(in rect: CGRect) -> Path {
        var posX: Double = 0.0
        var path = Path()

        for _ in 0..<data.count {
            path.move(to: CGPoint(x: posX, y: 0))
            path.addLine(to: CGPoint(x: posX, y: height))
            posX += widthLine
        }

        return path
    }
}

struct LineHorizontalCustom: Shape {
    var height: CGFloat
    var data = [Datum]()
    var widthLine: CGFloat

    func path(in rect: CGRect) -> Path {
        var posX: Double = 0.0
        var path = Path()

        for index in 1...10 {
            path.move(to: CGPoint(x: 0, y: height * (CGFloat(index) / 10.0)))
            path.addLine(to: CGPoint(x: CGFloat(data.count) * widthLine, y: height * (CGFloat(index) / 10.0)))
            posX += widthLine
        }

        return path
    }
}

#Preview {
    LineChartView()
//        .previewInterfaceOrientation(.landscapeLeft)
}
