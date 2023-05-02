//
//  wholePreserveTool.swift
//  Allive
//
//  Created by Fan on 29/04/2023.
//

import UIKit

class wholePreserveTool: NSObject {
    
    var expenseArr :[(expense:String,mypounds:String,myvalue:String)]?
    var needTodoArr :[(dotime:String,todoName:String)]?
    var exerciseArr :[(expense:String,mypounds:String,myvalue:String)]?
    
    
    static var preserveTool: wholePreserveTool?
    class func shared() -> wholePreserveTool {
        if let temp = preserveTool {
            return temp
        } else {
            preserveTool = wholePreserveTool()
            return preserveTool!
        }
    }
    
    override init() {
        super.init()
    }
    
}
