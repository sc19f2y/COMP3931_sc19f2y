//
//  MytodolistView.swift
//  Allive
//
//  Created by Fan on 29/04/2023.
//

import UIKit

class MytolistView: UIView {
    
    let AddBtn = UIButton()
    var listData : [(dotime:String,todoName:String)] = []
    let tableView = UITableView()
    let footview  = UIView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 60))
    var cellrelaodBlock:(()->Void)?
    var deleteBlock:(()->Void)?
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeUI(){
        let scollviewH = kScreenHeight - statusAndNavigationHeight() - homeIndicatorHeight() - 100
        tableView.frame = CGRect.init(x: 0, y: 0, width: kScreenWidth, height:scollviewH )
        tableView.separatorColor = UIColor.gray
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.register(MyTodolistCell.classForCoder(), forCellReuseIdentifier: "MyTodolistCell")
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
        
        
    }
    
    @objc func addBtnClick(){
        
        cellrelaodBlock?()
        
        
        
    }
}

extension MytolistView : UITableViewDelegate,UITableViewDataSource{
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
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MyTodolistCell", for: indexPath) as? MyTodolistCell {
            
            if listData.count > 0 {
                cell.setData(text: listData[indexPath.row].todoName)
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
