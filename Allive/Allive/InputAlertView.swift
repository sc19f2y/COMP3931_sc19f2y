//
//  InputAlertView.swift
//  Allive
//
//  Created by Fan on 29/04/2023.
//

import UIKit

class InputAlertView: UIView {
    
    let myinputView  =  UITextView()
    var finishBlock:((String)->Void)?
    let finishBtn = UIButton()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .lightGray
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeUI(){
        self.addSubview(myinputView)
        myinputView.frame = CGRect.init(x: 25, y: 10, width: 250, height: 200)
        myinputView.backgroundColor = .white
        myinputView.textColor = .black
        myinputView.textAlignment = .left
        
        self.addSubview(finishBtn)
        finishBtn.frame = CGRect.init(x: ( 300 - 100  ) /  2, y: 230, width: 100, height: 30)
        finishBtn.setTitle("Confirm", for: .normal)
        finishBtn.addTarget(self, action: #selector(finishBtnClick), for: .touchUpInside)
        finishBtn.backgroundColor = UIColor.green
       
    }
    
    @objc func finishBtnClick(){
        finishBlock?(myinputView.text)
        self.removeFromSuperview()
    }
    
    
   
    
}
