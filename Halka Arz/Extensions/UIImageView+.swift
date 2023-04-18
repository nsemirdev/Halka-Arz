//
//  UIImageView+.swift
//  Halka Arz
//
//  Created by Emir Alkal on 18.04.2023.
//

import UIKit

extension UIImageView {
    convenience init(name: String? = nil, contentMode: ContentMode) {
        if let name {
            self.init(image: UIImage(named: name))
        } else {
            self.init()
        }
        self.contentMode = contentMode
    }
}
