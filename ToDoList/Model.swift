//
//  Model.swift
//  ToDoList
//
//  Created by Сергей Кошкин on 05/11/2018.
//  Copyright © 2018 Сергей Кошкин. All rights reserved.
//

import Foundation

var ToDoItems : [[String : Any]] {
    set{
        UserDefaults.standard.set(newValue, forKey: "ToDoDataKey")
        UserDefaults.standard.synchronize()
    }
    get{
        if let array = UserDefaults.standard.array(forKey: "ToDoDataKey") as? [[String : Any]]{
             return array
        } else {
            return []
        }
    }
}

func addItem(nameItem: String, isCompleted : Bool = false) {
    ToDoItems.append(["Name" : nameItem, "isCompleted" : isCompleted])
}

func removeItem(at index: Int) {
    ToDoItems.remove(at: index)
}

func changeState(at item: Int ) -> Bool{
    print("Before:")
    print(ToDoItems[item]["isCompleted"]!)
    ToDoItems[item]["isCompleted"] = !(ToDoItems[item]["isCompleted"] as! Bool)
    print("After:")
    print(ToDoItems[item]["isCompleted"]!)
    return ToDoItems[item]["isCompleted"] as! Bool
}

func moveItem(fromIndex: Int, toIndex : Int){
    print(ToDoItems[fromIndex]["isCompleted"]!)
    let from = ToDoItems[fromIndex]
    print(from["isCompleted"]!)
    removeItem(at: fromIndex)
    ToDoItems.insert(from, at: toIndex)
}
