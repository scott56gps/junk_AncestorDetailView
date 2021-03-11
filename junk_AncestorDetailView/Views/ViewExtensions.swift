//
//  ViewExtensions.swift
//  junk_AncestorDetailView
//
//  Created by Scott Nicholes on 1/17/21.
//

import SwiftUI

extension View {
    @ViewBuilder
    func `if`<TrueContent: View, FalseContent: View>(_ condition: Bool,
                                                     if ifTransform: (Self) -> TrueContent,
                                                     else elseTransform: (Self) -> FalseContent) -> some View {
        if condition {
            ifTransform(self)
        } else {
            elseTransform(self)
        }
    }
    
    /// Adds a border to this view with the specified width, edges and color
    func border(width: CGFloat, edges: [Edge], color: Color) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color))
    }
}
