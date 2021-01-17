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
        Text(ancestor.name)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AncestorDetailView(ancestor: Ancestor(name: "Evangelina De Luna", ordinancesCompleted: [.baptism, .confirmation]))
    }
}
