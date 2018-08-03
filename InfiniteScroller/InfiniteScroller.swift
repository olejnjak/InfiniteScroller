//
//  InfiniteScroller.swift
//  InfiniteScroller
//
//  Created by Jakub Olejník on 03/08/2018.
//  Copyright © 2018 Jakub Olejník. All rights reserved.
//

import UIKit

public final class InfiniteScroller {
    public typealias NextPageCompletion = () -> (Void)
    
    public var nextPageAction: (@escaping NextPageCompletion) -> Void = { $0() }
    public var nextPageDebouncePeriod = TimeInterval(1)
    
    private let bottomTreshold: CGFloat
    
    private weak var scrollView: UIScrollView?
    
    private var scrollViewObservation: NSKeyValueObservation?
    private var lastNextPageCall = Date()
    private var isNextPageActionExecuting = false
    
    // MARK: Initializers
    
    public init(scrollView: UIScrollView, bottomTreshold: CGFloat = UIScreen.main.bounds.height) {
        self.scrollView = scrollView
        self.bottomTreshold = bottomTreshold
    }
    
    // MARK: Public interface
    
    public func start() {
        assert(scrollView != nil, "Unexpected nil scrollview")
        
        if let scrollView = scrollView {
            observeScrollView(scrollView)
        }
    }
    
    public func stop() {
        scrollViewObservation?.invalidate()
    }
    
    // MARK: Private helpers
    
    private func observeScrollView(_ scrollView: UIScrollView) {
        scrollViewObservation = scrollView.observe(\.contentOffset, options: [.new, .old]) { [weak self] scrollView, change in
            DispatchQueue.main.async {
                self?.contentOffsetChanged(in: scrollView, oldOffset: change.oldValue)
            }
        }
    }
    
    private func contentOffsetChanged(in scrollView: UIScrollView, oldOffset: CGPoint?) {
        if let oldOffsetY = oldOffset?.y, oldOffsetY >= scrollView.contentOffset.y { return } // if scrolling bottom to top don't do anything
        
        let offsetY = scrollView.contentOffset.y
        let actionOffset = scrollView.contentSize.height - bottomTreshold
        let isOffsetAfterTreshhold = offsetY > actionOffset || offsetY >= scrollView.contentSize.height
        
        if isOffsetAfterTreshhold, lastNextPageCall.timeIntervalSinceNow < -nextPageDebouncePeriod, !isNextPageActionExecuting {
            startNextPageAction()
        }
    }
    
    private func startNextPageAction() {
        lastNextPageCall = Date()
        isNextPageActionExecuting = true
        nextPageAction { [weak self] in self?.isNextPageActionExecuting = false }
    }
}
