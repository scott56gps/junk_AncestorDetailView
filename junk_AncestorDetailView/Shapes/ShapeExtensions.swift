//
//  ShapeExtensions.swift
//  junk_AncestorDetailView
//
//  Created by Scott Nicholes on 3/11/21.
//

import SwiftUI

extension InsettableShape {
    /// Adds a stroked border to this view with the specified width, edges and color
    func strokeBorder(width: CGFloat, edges: [Edge], color: Color) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color)).foregroundColor(.clear)
    }
}
