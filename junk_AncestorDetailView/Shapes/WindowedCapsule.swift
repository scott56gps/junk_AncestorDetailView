//
//  WindowedCapsule.swift
//  junk_AncestorDetailView
//
//  Created by Scott Nicholes on 2/2/21.
//

import SwiftUI

struct WindowedCapsule: View {
    var numWindows: Int
    
    var body: some View {
        HStack(spacing: 0) {
            CapsuleEnd()
                .overlay(CapsuleEnd().stroke(Color.blue, lineWidth: 2))
                .foregroundColor(.clear)
                .frame(width: 50, height: 50, alignment: .center)
            
            ForEach(0..<numWindows, id: \.self) {_ in
                Rectangle()
                    .strokeBorder(Color.blue, lineWidth: 2)
                    .frame(width: 50, height: 50, alignment: .center)
            }
                
            CapsuleEnd()
                .rotation(.degrees(180))
                .overlay(CapsuleEnd().rotation(.degrees(180)).stroke(Color.blue, lineWidth: 2))
                .foregroundColor(.clear)
                .frame(width: 50, height: 50, alignment: .center)
        }
    }
}

struct WindowedCapsule_Previews: PreviewProvider {
    static var previews: some View {
        WindowedCapsule(numWindows: 0)
    }
}
