//
//  MyexpenseView.swift
//  Allive
//
//  Created by Fan on 29/04/2023.
//

import UIKit

class MyexpenseView: UIView {
    let AddBtn = UIButton()
    
    var listData : [(expense:String,mypounds:String,myvalue:String)] = []
    let tableView = UITableView()
    let footview  = UIView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 60))
    var cellrelaodBlock:(()->Void)?
    
    let btnCountView  = UIView()
    var isexpense = false
    let totalTest = UILabel()
    let totalValue = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeUI(){
        let scollviewH = kScreenHeight - statusAndNavigationHeight() - homeIndicatorHeight() - 100 - 50
        tableView.frame = CGRect.init(x: 0, y: 0, width: kScreenWidth, height:scollviewH )
        tableView.separatorColor = UIColor.gray
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.register(MyexpenseViewCell.classForCoder(), forCellReuseIdentifier: "MyexpenseViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        tableView.backgroundColor = .white
        tableView.bounces = false
        self.addSubview(tableView)
        
        footview.addSubview(AddBtn)
        AddBtn.frame = CGRect.init(x: 15, y: 15, width: 30, height: 30)
        AddBtn.setImage(UIImage.init(named: "addContent"), for: .normal)
        AddBtn.addTarget(self, action: #selector(addBtnClick), for: .touchUpInside)
        tableView.tableFooterView = footview
        
        
        self.addSubview(btnCountView)
        btnCountView.frame = CGRect.init(x: 0, y: scollviewH, width: kScreenWidth, height: 50)
        btnCountView.backgroundColor = .white
        btnCountView.addSubview(totalTest)
        totalTest.frame = CGRect.init(x: 15, y: 0, width: (kScreenWidth - 30 ) / 2, height: 50)
        totalTest.text = "Total"
        totalTest.textColor = .black
        totalTest.textAlignment = .left
        
        let breakline5 = UIView()
        breakline5.frame = CGRect.init(x:  (kScreenWidth - 30 ) / 2, y: 0, width: 1, height: 50)
        breakline5.backgroundColor = .black
        btnCountView.addSubview(breakline5)
        
        btnCountView.addSubview(totalValue)
        totalValue.frame = CGRect.init(x: 15 + (kScreenWidth - 30 ) / 2, y: 0, width: (kScreenWidth - 30 ) / 2, height: 50)
        totalValue.text = "0"
        totalValue.textColor = .black
        totalValue.textAlignment = .left
        
        btnCountView.layer.borderWidth = 1
        btnCountView.layer.masksToBounds = true
        btnCountView.layer.borderColor = UIColor.black.cgColor
    }
    
    @objc func addBtnClick(){
        
        cellrelaodBlock?()
        
        
        
    }
}

extension MyexpenseView : UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return  1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if listData.count > 0 {
            return listData.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MyexpenseViewCell", for: indexPath) as? MyexpenseViewCell {
            
            if listData.count > 0 {
                let item = listData[indexPath.row]
                if isexpense {
                    cell.setData(leftStr: item.expense, rightStr: item.mypounds + item.myvalue)
                }else{
                    cell.setData(leftStr: item.expense, rightStr:  item.myvalue + item.mypounds )
                }
                
                cell.deleteBtnBlock = {
                    
                    let view  =  MessageAlertView()
                    view.frame = CGRect.init(x: (self.frame.width - 300 )/2, y: (self.frame.height - 300 ) /  2, width: 300, height: 300)
                    view.messageLabel.text = "Are you sure you want to delete this one?"
                    view.cancelBlock = {
                        
                    }
                    view.confirmBlock = {
                        self.listData.remove(at: indexPath.row)
                        tableView.reloadData()
                    }
                    
                    self.addSubview(view)
                    
                    
                   
                }
              
            }
           
            return cell
        }
        return UITableViewCell()
    }
}
