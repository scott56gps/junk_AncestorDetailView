//
//  OrdinanceProgressView.swift
//  junk_AncestorDetailView
//
//  Created by Scott Nicholes on 1/17/21.
//

import SwiftUI

/**
 Displays a progress bar of an ancestor's completed ordinances.
 
 ordinancesCompleted: [Ordiance] - A collection of completed ordiances.
 */
struct OrdinanceProgressView: View {
    var ordinancesCompleted: [Ordinance]
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(Ordinance.allCases, id: \.self) {ordinance in
                createOrdinanceTile(ordinance)
            }
        }
    }
    
    @ViewBuilder
    func createOrdinanceTile(_ ordinance: Ordinance) -> some View {
        if (ordinance == .baptism) {
            CapsuleEnd()
                .foregroundColor(.clear)
                .frame(width: 50, height: 50, alignment: .center)
                .overlay(CapsuleEnd().stroke(Color.blue, lineWidth: 2)
                            .overlay(Text(ordinance.rawValue)))
        } else if (ordinance == .sealingToSpouse) {
            CapsuleEnd()
                .rotation(.degrees(180))
                .foregroundColor(.clear)
                .frame(width: 50, height: 50, alignment: .center)
                .overlay(CapsuleEnd().rotation(.degrees(180)).stroke(Color.blue, lineWidth: 2)
                            .overlay(Text(ordinance.rawValue)))
        } else {
            Rectangle()
                .strokeBorder(Color.blue, lineWidth: 2)
                .frame(width: 50, height: 50, alignment: .center)
                .overlay(Text(ordinance.rawValue))
        }
    }
    
    func createFilledTile() -> some View {
        return Rectangle()
            .fill(Color.blue)
            .frame(width: 25, height: 25, alignment: .center)
    }
    
    func createEmptyTile() -> some View {
        return Rectangle()
            .strokeBorder(Color.blue, lineWidth: 1)
            .frame(width: 25, height: 25, alignment: .center)
    }
    
    func createFilledCapsule() -> some View {
        return Capsule()
            .fill(Color.blue)
            .frame(width: 40, height: 25, alignment: .center)
    }
}

struct OrdinanceProgressView_Previews: PreviewProvider {
    static var previews: some View {
        OrdinanceProgressView(ordinancesCompleted: [.baptism, .confirmation])
    }
}
