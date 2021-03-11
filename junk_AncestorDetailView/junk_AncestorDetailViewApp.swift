//
//  junk_AncestorDetailViewApp.swift
//  junk_AncestorDetailView
//
//  Created by Scott Nicholes on 1/17/21.
//

import SwiftUI

@main
struct junk_AncestorDetailViewApp: App {
    var body: some Scene {
        WindowGroup {
            AncestorDetailView(ancestor: Ancestor(name: "Evangelina De Luna", gender: .female, ordinancesCompleted: [.baptism, .confirmation]))
        }
    }
}
