//
//  CapsuleEnd.swift
//  junk_AncestorDetailView
//
//  Created by Scott Nicholes on 2/2/21.
//

import SwiftUI

struct CapsuleEnd: InsettableShape {
    var insetAmount: CGFloat = 0
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: (rect.width / 2) - insetAmount, startAngle: .degrees(270), endAngle: .degrees(90), clockwise: true)
            path.move(to: CGPoint(x: rect.midX, y: rect.minY + insetAmount))
            path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY + insetAmount))
            path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.maxY - insetAmount))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY - insetAmount))
        }
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var capsuleEnd = self
        capsuleEnd.insetAmount += amount
        return capsuleEnd
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
