//
//  ViewExtensions.swift
//  junk_AncestorDetailView
//
//  Created by Scott Nicholes on 1/17/21.
//

import SwiftUI

extension View {
    @ViewBuilder
    func `ifElse`<TrueContent: View, FalseContent: View>(_ condition: Bool,
                                                         if ifTransform: (Self) -> TrueContent,
                                                         else elseTransform: (Self) -> FalseContent) -> some View {
        if condition {
            ifTransform(self)
        } else {
            elseTransform(self)
        }
    }
}
