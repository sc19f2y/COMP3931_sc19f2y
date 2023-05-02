//
//  MyexpenseViewCell.swift
//  Allive
//
//  Created by Fan on 29/04/2023.
//

import UIKit

class MyexpenseViewCell: UITableViewCell {

    let lefttitle = UILabel()
    let righttitle = UILabel()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeUI()
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func  makeUI(){
        
        self.contentView.addSubview(lefttitle)
        lefttitle.frame = CGRect.init(x: 15, y: 15, width: ( kScreenWidth - 30 ) /  2, height:  30)
        lefttitle.textAlignment = .left
        lefttitle.font = UIFont.systemFont(ofSize: 15)
        lefttitle.textColor = .black
        
        self.contentView.addSubview(righttitle)
        righttitle.frame = CGRect.init(x: 15 +  ( kScreenWidth - 30 ) /  2, y: 15, width: ( kScreenWidth - 30 ) /  2, height:  30)
        righttitle.textAlignment = .left
        righttitle.font = UIFont.systemFont(ofSize: 15)
        righttitle.textColor = .black
    }

    
    func setData(leftStr:String,rightStr:String){
        righttitle.text = rightStr
        
        lefttitle.text = leftStr
    }
}
