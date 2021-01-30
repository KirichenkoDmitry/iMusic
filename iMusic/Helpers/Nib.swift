//
//  Nib.swift
//  iMusic
//
//  Created by Дмитрий Кириченко on 27.12.2020.
//

import UIKit

extension UIView {
    
    class func loadFromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}

