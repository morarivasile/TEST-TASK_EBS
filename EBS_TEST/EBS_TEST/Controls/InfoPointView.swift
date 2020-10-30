//
//  InfoPointView.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 30.10.2020.
//

import UIKit

final class InfoPointView: UIView {
    
    private let dotView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 3
        return view
    }()
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 5
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    func setupWith(info: String) {
        textLabel.text = info
    }
    
    private func setupLayout() {
        addSubview(dotView)
        addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            dotView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            dotView.widthAnchor.constraint(equalToConstant: 6),
            dotView.heightAnchor.constraint(equalToConstant: 6),
            
            textLabel.topAnchor.constraint(equalTo: topAnchor),
            textLabel.leadingAnchor.constraint(equalTo: dotView.trailingAnchor, constant: 20),
            textLabel.topAnchor.constraint(equalTo: dotView.topAnchor, constant: -8),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
