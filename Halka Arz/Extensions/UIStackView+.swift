//
//  UIStackView+.swift
//  Halka Arz
//
//  Created by Emir Alkal on 18.04.2023.
//

import UIKit

extension UIStackView {
    convenience init(
        axis: NSLayoutConstraint.Axis,
        spacing: CGFloat,
        distribution: Distribution,
        alignment: Alignment,
        subviews: [UIView]
    ) {
        self.init()
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
        self.alignment = alignment
        
        subviews.forEach {
            addArrangedSubview($0)
        }
    }
}
