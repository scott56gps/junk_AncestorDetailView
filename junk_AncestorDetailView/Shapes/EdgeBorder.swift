//
//  EdgeBorder.swift
//  junk_AncestorDetailView
//
//  Created by Scott Nicholes on 3/11/21.
//
import SwiftUI

struct EdgeBorder: InsettableShape {
    var width: CGFloat
    var edges: [Edge]
    var insetAmount: CGFloat = 0
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            let paths = edges.map { (edge) -> Path in
                Path { subPath in
                    var x: CGFloat {
                        switch edge {
                        case .top, .bottom, .leading: return rect.minX + insetAmount
                        case .trailing: return (rect.maxX - insetAmount) - width
                        }
                    }
                    
                    var y: CGFloat {
                        switch edge {
                        case .top, .leading, .trailing: return rect.minY + insetAmount
                        case .bottom: return (rect.maxY - insetAmount) - width
                        }
                    }
                    
                    var pathWidth: CGFloat {
                        switch edge {
                        case .top, .bottom: return rect.width - insetAmount
                        case .leading, .trailing: return self.width
                        }
                    }
                    
                    var height: CGFloat {
                        switch edge {
                        case .top, .bottom: return self.width
                        case .leading, .trailing: return rect.height - insetAmount
                        }
                    }
                    
                    subPath.addPath(Path(CGRect(x: x, y: y, width: pathWidth, height: height)))
                }
            }
            
            for tempPath in paths {
                path.addPath(tempPath)
            }
        }
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var border = self
        border.insetAmount += amount
        return border
    }
}

struct EdgeBorder_Previews: PreviewProvider {
    static var previews: some View {
        EdgeBorder(width: 2, edges: [.leading])
            .foregroundColor(.red)

    }
}
