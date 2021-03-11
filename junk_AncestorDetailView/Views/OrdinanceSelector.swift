//
//  OrdinanceSelector.swift
//  junk_AncestorDetailView
//
//  Created by Scott Nicholes on 3/10/21.
//

import SwiftUI

struct OrdinanceSelector: View {
    var ordinancesCompleted: [Ordinance]
    
    var body: some View {
        HStack {
            ForEach(Ordinance.allCases, id: \.self) { ordinance in
                Text(ordinance.rawValue)
//                Button("Select") {
//                    print("\(ordinance.rawValue) selected")
//                }
            }
        }
    }
}

struct OrdinanceSelector_Previews: PreviewProvider {
    static var previews: some View {
        OrdinanceSelector(ordinancesCompleted: [.baptism, .confirmation])
    }
}
