//
//  ContentView.swift
//  junk_AncestorDetailView
//
//  Created by Scott Nicholes on 1/17/21.
//

import SwiftUI

struct AncestorDetailView: View {
    var ancestor: Ancestor
    
    var body: some View {
        VStack {
            Text(ancestor.name)
                .padding()
            HStack(spacing: 0) {
                ForEach(Ordinance.allCases, id: \.self) { ordinance in
                    if (ordinance == .confirmation || ordinance == .initiatory || ordinance == .endowment || ordinance == .sealingToSpouse) {
                        Text(ordinance.rawValue)
                            .frame(width: 25)
                            .background(Rectangle()
                                            .strokeBorder(Color.blue, lineWidth: 1)
                                            .frame(width: 25, height: 25, alignment: .center))
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AncestorDetailView(ancestor: Ancestor(name: "Evangelina De Luna", ordinancesCompleted: [.baptism, .confirmation]))
    }
}
