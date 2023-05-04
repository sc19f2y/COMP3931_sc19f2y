//
//  MyTodolistCell.swift
//  Allive
//
//  Created by Fan on 29/04/2023.
//

import UIKit

class MyTodolistCell: UITableViewCell {

    let leftseletedBtn = UIButton()
    let rightTitle = UILabel()
    let deleteBtn = UIButton()
    var deleteBtnBlock:(()->Void)?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeUI()
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func  makeUI(){
        self.contentView.addSubview(leftseletedBtn)
        leftseletedBtn.frame = CGRect.init(x: 15, y: 15, width: 30, height: 30)
        leftseletedBtn.isSelected = false
        leftseletedBtn.setImage(UIImage(named: "todoNormal"), for: .normal)
        leftseletedBtn.setImage(UIImage(named: "todoSeleted"), for: .selected)
        leftseletedBtn.addTarget(self, action: #selector(leftseletedBtnCick), for: .touchUpInside)
        
        self.contentView.addSubview(rightTitle)
        rightTitle.frame = CGRect.init(x: 60, y: 15, width: kScreenWidth - 75, height: 30)
        rightTitle.textAlignment = .left
        rightTitle.font = UIFont.systemFont(ofSize: 15)
        rightTitle.textColor = UIColor.black
        
        self.contentView.addSubview(deleteBtn)
        deleteBtn.frame = CGRect.init(x: kScreenWidth - 50, y: 15, width: 30, height: 30)
        deleteBtn.setImage(UIImage(named: "delete-s"), for: .normal)
        deleteBtn.addTarget(self, action: #selector(deleteBtnCLick), for: .touchUpInside)
        
    }
    
    @objc func deleteBtnCLick(){
        deleteBtnBlock?()
    }
    func setData(text:String){
        
        rightTitle.text = text
        
    }
    
    @objc func leftseletedBtnCick(){
        leftseletedBtn.isSelected = !leftseletedBtn.isSelected
        
        if leftseletedBtn.isSelected {
            rightTitle.textColor = UIColor.gray
        }else{
            rightTitle.textColor = UIColor.black
        }
        
    }

}
