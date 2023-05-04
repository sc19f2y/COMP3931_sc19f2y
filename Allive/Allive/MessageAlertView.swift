//
//  MessageAlertView.swift
//  Allive
//
//  Created by Fan on 04/05/2023.
//

import UIKit


class MessageAlertView: UIView {
    
    var titleLabel = UILabel()
    var messageLabel = UILabel()
    var cancelButton = UIButton()
    var confirmButton = UIButton()
    var cancelBlock:(()->Void)?
    var confirmBlock:(()->Void)?
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //main interface
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 8.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.lightGray.cgColor
        
        //title text
        titleLabel.frame = CGRect(x: 16, y: 16, width: 300 - 32, height: 24)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.textColor = UIColor.black
        titleLabel.textAlignment = .center
        self.addSubview(titleLabel)
        
        //specification text
        messageLabel.frame = CGRect(x: 16, y: 48, width: 300 - 32, height: 70)
        messageLabel.font = UIFont.systemFont(ofSize: 16)
        messageLabel.textColor = UIColor.darkGray
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        self.addSubview(messageLabel)
        
        //Yes button
        confirmButton.frame = CGRect(x: (300 / 2) + 16, y: 130, width: (300 / 2) - 32, height: 44)
        confirmButton.setTitle("Yes", for: UIControl.State())
        confirmButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        confirmButton.setTitleColor(UIColor.white, for: UIControl.State())
        confirmButton.backgroundColor = UIColor.lightGray
        confirmButton.layer.cornerRadius = 4.0
        confirmButton.addTarget(self, action: #selector(positiveTapped), for: .touchUpInside)
        self.addSubview(confirmButton)
        
        //No button
        cancelButton.frame = CGRect(x: 16, y: 130, width: (300 / 2) - 32, height: 44)
        cancelButton.setTitle("No", for: UIControl.State())
        cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        cancelButton.setTitleColor(UIColor.white, for: UIControl.State())
        cancelButton.backgroundColor = UIColor.green
        cancelButton.layer.cornerRadius = 4.0
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        self.addSubview(cancelButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func positiveTapped(){
        confirmBlock?()
        self.removeFromSuperview()
    }
    @objc func cancelButtonTapped(){
        cancelBlock?()
        self.removeFromSuperview()
    }
}
