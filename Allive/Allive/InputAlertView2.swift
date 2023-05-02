//
//  InputAlertView2.swift
//  Allive
//
//  Created by Fan on 29/04/2023.
//

import UIKit

class InputAlertView2: UIView {
    let finishBtn = UIButton()
    var finishBlock:((String,String)->Void)?
    let TopInput = UITextField()
    let bottonInput = UITextField()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .lightGray
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeUI(){
        
        self.addSubview(TopInput)
        TopInput.placeholder = ""
        TopInput.frame = CGRect.init(x: 25, y: 10, width: 250, height: 50)
        TopInput.textColor = .black
        TopInput.backgroundColor = UIColor.white
        
        self.addSubview(bottonInput)
        bottonInput.placeholder = ""
        bottonInput.frame = CGRect.init(x: 25, y: 90, width: 250, height: 50)
        bottonInput.textColor = .black
        bottonInput.backgroundColor = UIColor.white
        
        
        self.addSubview(finishBtn)
        finishBtn.frame = CGRect.init(x: ( 300 - 100  ) /  2, y: 230, width: 100, height: 30)
        finishBtn.setTitle("Confirm", for: .normal)
        finishBtn.addTarget(self, action: #selector(finishBtnClick), for: .touchUpInside)
        finishBtn.backgroundColor = UIColor.green
        
    }
    
    func setPlaceHolder(topstr:String,bottomStr:String){
        TopInput.placeholder = topstr
        bottonInput.placeholder = bottomStr
    }
    
    
    @objc func finishBtnClick(){
        finishBlock?(TopInput.text ?? "",bottonInput.text ?? "")
        self.removeFromSuperview()
    }

}
