//
//  EdgeBorder.swift
//  junk_AncestorDetailView
//
//  Created by Scott Nicholes on 3/11/21.
//
import SwiftUI

struct EdgeBorder: Shape {
    var width: CGFloat
    var edges: [Edge]
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            let paths = edges.map { (edge) -> Path in
                Path { subPath in
                    var x: CGFloat {
                        switch edge {
                        case .top, .bottom, .leading: return rect.minX
                        case .trailing: return rect.maxX - width
                        }
                    }
                    
                    var y: CGFloat {
                        switch edge {
                        case .top, .leading, .trailing: return rect.minY
                        case .bottom: return rect.maxY - width
                        }
                    }
                    
                    var pathWidth: CGFloat {
                        switch edge {
                        case .top, .bottom: return rect.width
                        case .leading, .trailing: return self.width
                        }
                    }
                    
                    var height: CGFloat {
                        switch edge {
                        case .top, .bottom: return self.width
                        case .leading, .trailing: return rect.height
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
}
