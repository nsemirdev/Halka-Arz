//
//  UIFont+.swift
//  Halka Arz
//
//  Created by Emir Alkal on 18.04.2023.
//

import UIKit

extension UIFont {
    static func poppin400(size: CGFloat) -> UIFont {
        .init(name: "Poppins-Regular", size: size)!
    }
    
    static func poppin500(size: CGFloat) -> UIFont {
        .init(name: "Poppins-Medium", size: size)!
    }
    
    static func poppin900(size: CGFloat) -> UIFont {
        .init(name: "Poppins-Black", size: size)!
    }
}
