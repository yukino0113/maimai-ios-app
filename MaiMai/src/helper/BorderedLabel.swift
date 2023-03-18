//
//  BorderedLabel.swift
//  MaiMai
//
//  Created by Yukino on 2023/3/18.
//

import Foundation
import UIKit

class BorderedLabel: UILabel {
    
    var borderColor: UIColor = .black
    var borderWidth: CGFloat = 2.0
    
    override func drawText(in rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        context?.saveGState()
        
        context?.setLineWidth(borderWidth)
        context?.setLineJoin(.round)
        context?.setTextDrawingMode(.stroke)
        borderColor.set()
        super.drawText(in: rect)
        
        context?.restoreGState()
        
        textColor.set()
        context?.setTextDrawingMode(.fill)
        super.drawText(in: rect)
    }
}
