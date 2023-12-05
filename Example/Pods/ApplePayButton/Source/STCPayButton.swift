//
//  ApplePayButton.swift
//  Ottu
//
//  Created by Maninder Singh on 10/05/23.
//

import UIKit

@IBDesignable public class STCpayButton : UIButton{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    public override func draw(_ rect: CGRect) {
        self.setTitleColor(UIColor.white, for: .normal)
        self.setTitle("", for: .normal)
        self.tintColor = .white
        self.clipsToBounds = true
        self.titleLabel?.font = .systemFont(ofSize: 24)
        self.setTitleColor(.white, for: .normal)
        let bundle = Bundle(for: ApplepayButton.self)
        let bundleURL = bundle.resourceURL?.appendingPathComponent("AppleButton.bundle")
        let resourceBundle = Bundle(url: bundleURL!)
        
        if let image = UIImage(named: "stc_button", in: resourceBundle, compatibleWith: nil) {
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
        self.backgroundColor = UIColor(red: 73.0/255.0, green: 0, blue: 128.0/255.0, alpha: 1)
    }
 
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = UIColor(red: 73.0/255.0, green: 0, blue: 128.0/255.0, alpha: 1)
    }
    
}

