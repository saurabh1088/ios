//
//  PropertiesOption.swift
//  LearningAppFrameBoundCenterUIKit
//
//  Created by Saurabh Verma on 14/12/24.
//

import Foundation

enum PropertiesOption: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    
    case frame
    case bounds
    case center
    
    var printableDescription: String {
        switch self {
        case .frame:
            return "Frame"
        case .bounds:
            return "Bounds"
        case .center:
            return "Center"
        }
    }
        
    func cellReUseIdentifier() -> String {
        switch self {
        case .frame:
            return "frameOptionCell"
        case .bounds:
            return "boundsOptionCell"
        case .center:
            return "centerOptionCell"
        }
    }
        
    static func segueTypeFor(index: IndexPath) -> PropertiesOption? {
        switch index.row {
        case 0:
            return .frame
        case 1:
            return .bounds
        case 2:
            return .center
        default:
            return nil
        }
    }
}
    
