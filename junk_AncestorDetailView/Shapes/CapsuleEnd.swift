//
//  CapsuleEnd.swift
//  junk_AncestorDetailView
//
//  Created by Scott Nicholes on 2/2/21.
//

import SwiftUI

struct CapsuleEnd: Shape {
    func path(in rect: CGRect) -> Path {
        return Path({ path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: .degrees(270), endAngle: .degrees(90), clockwise: true)
            path.addLines([CGPoint(x: rect.maxX, y: rect.minY),
                           CGPoint(x: rect.maxX, y: rect.maxY),
                           CGPoint(x: rect.midX, y: rect.maxY),
                           CGPoint(x: rect.midX, y: rect.minY)])
        })
    }
}

struct CapsuleEnd_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleEnd()
            .frame(width: 100, height: 100, alignment: .center)
            .foregroundColor(.blue)
    }
}
