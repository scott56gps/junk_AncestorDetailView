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
struct OrdinanceProgress: View {
    var ordinancesCompleted: [Ordinance]
    var borderColor: Color = .blue
    var textColor: Color = .black
    var fillColor: Color = .blue
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(Ordinance.allCases, id: \.self) { ordinance in
                tileForOrdinance(ordinance)
                    .overlay(Text(ordinance.rawValue)
                                .foregroundColor(textColor))
                    .frame(width: 50, height: 50, alignment: .center)
            }
        }
    }
    
    @ViewBuilder
    func tileForOrdinance(_ ordinance: Ordinance) -> some View {
        switch ordinance {
        case .baptism: AnyView(CapsuleEnd()
                                .ifElse(ordinancesCompleted.contains(ordinance), if:
                                            { $0.fill(fillColor) }, else:
                                                { $0.strokeBorder(borderColor, lineWidth: 2) }))
            
        case .confirmation: AnyView(Rectangle()
                                        .ifElse(ordinancesCompleted.contains(ordinance), if:
                                                    { $0.fill(fillColor) }, else:
                                                        { $0.strokeBorder(width: 2, edges: [.top, .bottom], color: borderColor) }))
            
        case .sealingToSpouse: AnyView(CapsuleEnd()
                                        .rotation(.degrees(180))
                                        .ifElse(ordinancesCompleted.contains(ordinance), if:
                                                    { $0.fill(fillColor) }, else:
                                                        { $0.strokeBorder(borderColor, lineWidth: 2) }))
            
        default: AnyView(Rectangle()
                            .ifElse(ordinancesCompleted.contains(ordinance), if:
                                        { $0.fill(fillColor) }, else:
                                            { $0.strokeBorder(width: 2, edges: [.top, .bottom, .leading], color: borderColor) }))
        }
    }
}

struct OrdinanceProgressView_Previews: PreviewProvider {
    static var previews: some View {
        OrdinanceProgress(ordinancesCompleted: [.baptism, .confirmation], fillColor: .green)
    }
}
