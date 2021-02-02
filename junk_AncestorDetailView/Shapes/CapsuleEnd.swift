//
//  CapsuleEnd.swift
//  junk_AncestorDetailView
//
//  Created by Scott Nicholes on 2/2/21.
//

import SwiftUI

struct CapsuleEnd: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: .degrees(270), endAngle: .degrees(90), clockwise: true)
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        }
    }
}

struct CapsuleEnd_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            CapsuleEnd()
                .fill(Color.blue)
                .overlay(CapsuleEnd().stroke(Color.black, lineWidth: 2))
                .frame(width: 100, height: 100, alignment: .center)
            CapsuleEnd()
                .rotation(.degrees(180))
                .fill(Color.blue)
                .overlay(CapsuleEnd().rotation(.degrees(180)).stroke(Color.black, lineWidth: 2))
                .frame(width: 100, height: 100, alignment: .center)
        }
    }
}
