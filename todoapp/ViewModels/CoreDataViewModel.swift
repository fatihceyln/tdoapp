//
//  CoreDataViewModel.swift
//  todoapp
//
//  Created by Fatih Kilit on 24.01.2022.
//

import Foundation
import CoreData

class CoreDataViewModel: ObservableObject {
    let manager = CoreDataManager.shared
    @Published var lists: [ListEntity] = []
    @Published var tasks: [TaskEntity] = []
    
    init() {
        getLists()
    }
    
    func addList(titleForList title: String) {
        let newList = ListEntity(context: manager.context)
        newList.title = title
        save()
        getLists()
    }
    
    func getLists() {
        let request = NSFetchRequest<ListEntity>(entityName: "ListEntity")
        
        do {
            lists = try manager.context.fetch(request)
        } catch let error {
            print("Error. \(error)")
        }
    }
    
    func deleteList(indexSet: IndexSet) {
        guard let index = indexSet.first else {return}
        let entity = lists[index]
        manager.context.delete(entity)
        save()
        getLists()
    }
    
    func addTask(titleForTask title: String, list: ListEntity) {
        let newTask = TaskEntity(context: manager.context)
        newTask.title = title
        newTask.list = list
        newTask.isDone = false
        newTask.dateCreated = Date()
        save()
        getTasks(forList: list)
    }
    
    func getTasks(forList list: ListEntity) {
        let request = NSFetchRequest<TaskEntity>(entityName: "TaskEntity")
        
        let filter = NSPredicate(format: "list == %@", list)
        request.predicate = filter
        
        let sort = NSSortDescriptor(keyPath: \TaskEntity.isDone, ascending: true)
        request.sortDescriptors = [sort]
        
        do {
            tasks = try manager.context.fetch(request)
        } catch let error {
            print("Error. \(error)")
        }
    }
    
    func deleteTask(indexSet: IndexSet, forList list: ListEntity) {
        guard let index = indexSet.first else {return}
        let entity = tasks[index]
        manager.context.delete(entity)
        save()
        getTasks(forList: list)
    }
    
    func updateTask(task: TaskEntity, forList list: ListEntity) {
        task.isDone.toggle()
        save()
        getTasks(forList: list)
    }
    
    
    func save() {
        manager.save()
    }
}
