//
//  ContentView.swift
//  junk_AncestorDetailView
//
//  Created by Scott Nicholes on 1/17/21.
//

import SwiftUI

/**
 Displays an Ancestor's details, such as name and completed ordinances.
 
 ancestor: Ancestor - An ancestor for whom to display details
 */
struct AncestorDetailView: View {
    var ancestor: Ancestor
    
    var body: some View {
        VStack {
            Text(ancestor.name)
                .padding()
            OrdinanceProgress(ordinancesCompleted: ancestor.ordinancesCompleted)
//            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AncestorDetailView(ancestor: Ancestor(name: "Evangelina De Luna", gender: .female, ordinancesCompleted: [.baptism, .confirmation]))
    }
}
