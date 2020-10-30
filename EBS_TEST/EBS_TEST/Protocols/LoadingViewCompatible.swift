//
//  LoadingViewCompatible.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 30.10.2020.
//

import UIKit

protocol LoadingViewCompatible: class {
    func showLoadingView()
    func hideLoadingView()
}

fileprivate final class OverlayView: UIView {
    
    static let displayTag: Int = 513
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        alpha = 0.6
        backgroundColor = .white
        tag = OverlayView.displayTag
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

fileprivate final class IndicatorView: UIActivityIndicatorView {
    
    static let displayTag: Int = 512
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        style = .medium
        tag = IndicatorView.displayTag
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoadingViewCompatible where Self: UIViewController {
    
    private var overlayView: OverlayView? {
        return view.subviews.first(where: {
            $0 is OverlayView && $0.tag == OverlayView.displayTag
        }) as? OverlayView
    }
    
    private var indicatorView: IndicatorView? {
        return view.subviews.first(where: {
            $0 is UIActivityIndicatorView && $0.tag == IndicatorView.displayTag
        }) as? IndicatorView
    }
    
    func showLoadingView() {
        let overlayView = OverlayView()
        let indicatorView = IndicatorView(frame: .zero)
        
        view.addSubview(overlayView)
        view.addSubview(indicatorView)
        
        NSLayoutConstraint.activate([
            overlayView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            overlayView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            overlayView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            overlayView.topAnchor.constraint(equalTo: view.topAnchor),
            
            indicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        
        indicatorView.startAnimating()
    }
    
    func hideLoadingView() {
        overlayView?.removeFromSuperview()
        indicatorView?.removeFromSuperview()
    }
    
}
