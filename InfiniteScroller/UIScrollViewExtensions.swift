//
//  UIScrollViewExtensions.swift
//  InfiniteScroller
//
//  Created by Jakub Olejník on 03/08/2018.
//  Copyright © 2018 Jakub Olejník. All rights reserved.
//

import UIKit

public extension UIScrollView {
    private enum Keys {
        static var infiniteScroller = UInt8(0)
    }
    
    public var infiniteScroller: InfiniteScroller {
        if let infiniteScroller = objc_getAssociatedObject(self, &Keys.infiniteScroller) as? InfiniteScroller {
            return infiniteScroller
        }
        
        let infiniteScroller = InfiniteScroller(scrollView: self)
        objc_setAssociatedObject(self, &Keys.infiniteScroller, infiniteScroller, .OBJC_ASSOCIATION_RETAIN)
        return infiniteScroller
    }
}
