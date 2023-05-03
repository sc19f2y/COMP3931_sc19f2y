//
//  ViewController.swift
//  Allive
//
//  Created by Fan on 29/04/2023.
//

import UIKit
let kScreenWidth = UIScreen.main.bounds.width
let kScreenHeight = UIScreen.main.bounds.height
let kScreenScale = kScreenWidth / 375

//Height of Status Bar and Navigator
func statusAndNavigationHeight() -> CGFloat {
    if isIpX() {
        return 44.0 + 44.0
    }else {
        return 20.0 + 44.0
    }
}
//Height of Home
func homeIndicatorHeight() -> CGFloat {
       if isIpX() {
           return 34.0
       }else {
           return 0.0
       }
   }

//ipx or not
func isIpX() -> Bool {
       return isNotchScreen
   }

//notch or not
var isNotchScreen: Bool {

    if #available(iOS 11, *) {
         guard let w = UIApplication.shared.delegate?.window, let unwrapedWindow = w else {
             return kScreenHeight >= 812
         }

         if unwrapedWindow.safeAreaInsets.left > 0 || unwrapedWindow.safeAreaInsets.bottom > 0 {
             return true
         }
   }
   return false
}
class ViewController: UIViewController {

    let topSeletedView = UIView()
    let expenseBtn = UIButton()
    let todoBtn = UIButton()
    let exerciseBtn = UIButton()
    let bottomView = UIView()
    let yestodayBtn = UIButton()
    let todayBtn = UIButton()
    let tomorrowBtn = UIButton()
    
    let scollview = UIScrollView()
    
    let tolistView = MytolistView()
    let expenseView = MyexpenseView()
    let exerciseView = MyexpenseView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    
    func makeUI(){
        
        self.view.addSubview(topSeletedView)
        topSeletedView.frame = CGRect.init(x: 0, y: statusAndNavigationHeight(), width: kScreenWidth, height: 50)
        topSeletedView.layer.borderWidth = 1
        topSeletedView.layer.masksToBounds = true
        topSeletedView.layer.borderColor = UIColor.black.cgColor
        
        
        todoBtn.frame = CGRect.init(x: 0, y: 0, width: kScreenWidth /  3, height: 50)
        todoBtn.setTitle("To-do", for: .normal)
        todoBtn.setTitleColor(.gray, for: .normal)
        todoBtn.setTitleColor(.black, for: .selected)
        todoBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        todoBtn.addTarget(self, action: #selector(todoBtnCLick), for: .touchUpInside)
        topSeletedView.addSubview(todoBtn)
        
        let breakline1 = UIView()
        breakline1.frame = CGRect.init(x: kScreenWidth /  3, y: 0, width: 1, height: 50)
        breakline1.backgroundColor = .black
        topSeletedView.addSubview(breakline1)
        
        expenseBtn.frame = CGRect.init(x: kScreenWidth /  3, y: 0, width: kScreenWidth /  3, height: 50)
        expenseBtn.setTitle("Expense", for: .normal)
        expenseBtn.setTitleColor(.gray, for: .normal)
        expenseBtn.setTitleColor(.black, for: .selected)
        expenseBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        expenseBtn.addTarget(self, action: #selector(expenseBtnCLick), for: .touchUpInside)
        topSeletedView.addSubview(expenseBtn)
        
        
        let breakline2 = UIView()
        breakline2.frame = CGRect.init(x:  (kScreenWidth /  3) * 2, y: 0, width: 1, height: 50)
        breakline2.backgroundColor = .black
        topSeletedView.addSubview(breakline2)
        
        exerciseBtn.frame = CGRect.init(x: (kScreenWidth /  3) * 2 , y: 0, width: kScreenWidth /  3, height: 50)
        exerciseBtn.setTitle("Exercise", for: .normal)
        exerciseBtn.setTitleColor(.gray, for: .normal)
        exerciseBtn.setTitleColor(.black, for: .selected)
        exerciseBtn.addTarget(self, action: #selector(exerciseBtnCLick), for: .touchUpInside)
        exerciseBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        topSeletedView.addSubview(exerciseBtn)
        
        
        
        self.view.addSubview(bottomView)
        bottomView.frame = CGRect.init(x: 0, y: kScreenHeight - homeIndicatorHeight() - 50, width: kScreenWidth, height: 50)
        bottomView.layer.borderWidth = 1
        bottomView.layer.masksToBounds = true
        bottomView.layer.borderColor = UIColor.black.cgColor
        
        
        yestodayBtn.frame = CGRect.init(x: 0, y: 0, width: kScreenWidth /  3, height: 50)
        yestodayBtn.setTitle("Yestoday", for: .normal)
        yestodayBtn.setTitleColor(.gray, for: .normal)
        yestodayBtn.setTitleColor(.black, for: .selected)
        yestodayBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        yestodayBtn.addTarget(self, action: #selector(yestodayBtnCLick), for: .touchUpInside)
        bottomView.addSubview(yestodayBtn)
        
        let breakline3 = UIView()
        breakline3.frame = CGRect.init(x:  kScreenWidth /  3, y: 0, width: 1, height: 50)
        breakline3.backgroundColor = .black
        bottomView.addSubview(breakline3)
        
        todayBtn.frame = CGRect.init(x: kScreenWidth /  3, y: 0, width: kScreenWidth /  3, height: 50)
        todayBtn.setTitle("Today", for: .normal)
        todayBtn.setTitleColor(.gray, for: .normal)
        todayBtn.setTitleColor(.black, for: .selected)
        todayBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        todayBtn.addTarget(self, action: #selector(todayBtnCLick), for: .touchUpInside)
        bottomView.addSubview(todayBtn)
        
        let breakline4 = UIView()
        breakline4.frame = CGRect.init(x:  (kScreenWidth /  3) * 2, y: 0, width: 1, height: 50)
        breakline4.backgroundColor = .black
        bottomView.addSubview(breakline4)
        
        tomorrowBtn.frame = CGRect.init(x: (kScreenWidth /  3) * 2 , y: 0, width: kScreenWidth /  3, height: 50)
        tomorrowBtn.setTitle("Tomorrow", for: .normal)
        tomorrowBtn.setTitleColor(.gray, for: .normal)
        tomorrowBtn.setTitleColor(.black, for: .selected)
        tomorrowBtn.addTarget(self, action: #selector(tomorrowBtnCLick), for: .touchUpInside)
        tomorrowBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        bottomView.addSubview(tomorrowBtn)
        
        
        let scollviewH = kScreenHeight - statusAndNavigationHeight() - homeIndicatorHeight() - 100
        
        scollview.frame = CGRect.init(x: 0, y: statusAndNavigationHeight() + 50 , width: kScreenWidth, height: scollviewH )
        self.view.addSubview(scollview)
       
        
        tolistView.frame = CGRect.init(x: 0, y: 0, width: kScreenWidth, height: scollviewH)
        tolistView.backgroundColor = .red
        tolistView.cellrelaodBlock = {
            
            let view  = InputAlertView()
            view.frame = CGRect.init(x: (kScreenWidth - 300) /  2, y:  (kScreenHeight - 300 )  / 2, width: 300, height: 300)
            
            self.view.addSubview(view)
            view.finishBlock = { finishStr in
                let item = (dotime:"\(Date.now)",todoName:finishStr)
                self.tolistView.listData.append(item)
                wholePreserveTool.shared().needTodoArr = self.tolistView.listData
                self.tolistView.tableView.reloadData()
                
                
               
            }
            
            
            
        }
        scollview.addSubview(tolistView)
       
        
        expenseView.frame = CGRect.init(x: kScreenWidth, y: 0, width: kScreenWidth, height: scollviewH)
        expenseView.backgroundColor = .gray
        scollview.addSubview(expenseView)
        expenseView.isexpense = true
        expenseView.cellrelaodBlock = {
            
            let view  = InputAlertView2()
            view.frame = CGRect.init(x: (kScreenWidth - 300) /  2, y:  (kScreenHeight - 300 )  / 2, width: 300, height: 300)
          
            view.setPlaceHolder(topstr: "Expense", bottomStr: "￡")
            self.view.addSubview(view)
            view.finishBlock = { (topstr,bottomStr) in
                
                let item = (expense:topstr,mypounds:"￡",myvalue:bottomStr)
                self.expenseView.listData.append(item)
                wholePreserveTool.shared().expenseArr = self.expenseView.listData
                self.expenseView.tableView.reloadData()
                
                var sum: Float = 0

                for item in self.expenseView.listData {
                    if let value = Float(item.myvalue) {
                        sum += value
                    }
                }
                self.expenseView.totalValue.text = "￡" + "\(sum)"
            }
        }
        
        exerciseView.frame = CGRect.init(x: kScreenWidth * 2, y: 0, width: kScreenWidth, height: scollviewH)
        exerciseView.backgroundColor = .green
        exerciseView.isexpense = false
        scollview.addSubview(exerciseView)
        
        exerciseView.cellrelaodBlock = {
            
            let view  = InputAlertView2()
            view.frame = CGRect.init(x: (kScreenWidth - 300) /  2, y:  (kScreenHeight - 300 )  / 2, width: 300, height: 300)
            view.setPlaceHolder(topstr: "Exercise", bottomStr: "min")
            self.view.addSubview(view)
            view.finishBlock = { (topstr,bottomStr) in
                
                let item = (expense:topstr,mypounds:"mins",myvalue:bottomStr)
                self.exerciseView.listData.append(item)
                wholePreserveTool.shared().exerciseArr = self.exerciseView.listData
                self.exerciseView.tableView.reloadData()
                
                
                var sum: Float = 0

                for item in self.exerciseView.listData {
                    if let value = Float(item.myvalue) {
                        sum += value
                    }
                }
                self.exerciseView.totalValue.text =  "\(sum)" + "mins"
            }
        }
        
        
        scollview.isScrollEnabled = false
    }

    @objc func todoBtnCLick(){
        todoBtn.isSelected = true
        expenseBtn.isSelected = false
        exerciseBtn.isSelected = false
        scollview.contentOffset =  CGPoint.init(x: 0, y: 0)
        
    }
    @objc func expenseBtnCLick(){
        todoBtn.isSelected = false
        expenseBtn.isSelected = true
        exerciseBtn.isSelected = false
        scollview.contentOffset =  CGPoint.init(x: kScreenWidth, y: 0)
    }
    @objc func exerciseBtnCLick(){
        todoBtn.isSelected = false
        expenseBtn.isSelected = false
        exerciseBtn.isSelected = true
        scollview.contentOffset =  CGPoint.init(x: kScreenWidth * 2, y: 0)
    }
    
    @objc func yestodayBtnCLick(){
        yestodayBtn.isSelected = true
        todayBtn.isSelected = false
        tomorrowBtn.isSelected = false
        
        self.tolistView.listData = []
        self.expenseView.listData = []
        self.exerciseView.listData = []
        self.tolistView.tableView.reloadData()
        self.expenseView.tableView.reloadData()
        self.exerciseView.tableView.reloadData()
    }
    
    @objc func todayBtnCLick(){
        yestodayBtn.isSelected = false
        todayBtn.isSelected = true
        tomorrowBtn.isSelected = false
        
        self.tolistView.listData = wholePreserveTool.shared().needTodoArr ?? []
        self.expenseView.listData = wholePreserveTool.shared().expenseArr ?? []
        self.exerciseView.listData = wholePreserveTool.shared().exerciseArr ?? []
        self.tolistView.tableView.reloadData()
        self.expenseView.tableView.reloadData()
        self.exerciseView.tableView.reloadData()
    }
    
    @objc func tomorrowBtnCLick(){
        yestodayBtn.isSelected = false
        todayBtn.isSelected = false
        tomorrowBtn.isSelected = true
        
        self.tolistView.listData = []
        self.expenseView.listData = []
        self.exerciseView.listData = []
        self.tolistView.tableView.reloadData()
        self.expenseView.tableView.reloadData()
        self.exerciseView.tableView.reloadData()
    }

}

