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
            ForEach(Ordinance.allCases, id: \.self) { ordinance in
                if (ordinance == .confirmation || ordinance == .initiatory || ordinance == .endowment || ordinance == .sealingToSpouse) {
                    createOrdinanceTile(ordinance)
                        .if(ordinancesCompleted.contains(ordinance)) { $0.background(createFilledTile()) } else: { $0.background(createEmptyTile()) }
                } else {
                    Text(ordinance.rawValue)
                        .frame(width: 25)
                }
            }
        }
            .background(Capsule()
                            .strokeBorder(Color.blue, lineWidth: 1)
                            .frame(width: 150, height: 25, alignment: .center))
    }
    
    func createOrdinanceTile(_ ordinance: Ordinance) -> some View {
        return Text(ordinance.rawValue)
            .frame(width: 25)
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
}

struct OrdinanceProgressView_Previews: PreviewProvider {
    static var previews: some View {
        OrdinanceProgressView(ordinancesCompleted: [.baptism, .confirmation])
    }
}
