//
//  ApplePayButton.swift
//  Ottu
//
//  Created by Maninder Singh on 10/05/23.
//

import UIKit

@IBDesignable public class ApplepayButton : UIButton{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    public override func draw(_ rect: CGRect) {
        self.setTitleColor(UIColor.white, for: .normal)
        self.setTitle(" Pay", for: .normal)
        self.tintColor = .white
        self.clipsToBounds = true
        self.titleLabel?.font = .systemFont(ofSize: 24)
        self.setTitleColor(.white, for: .normal)
        if let image = UIImage(named: "apple copy", in: Bundle(for: Ottu.self), compatibleWith: nil) {
            self.setImage(image, for: .normal)
        }
        self.imageView?.contentMode = .scaleAspectFit
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0.0),
            self.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0.0),
            self.heightAnchor.constraint(equalToConstant: 50),
            self.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0.0)
        ])
        self.layer.cornerRadius = 25
        self.backgroundColor = .black
    }
 
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .black
    }
    
}

