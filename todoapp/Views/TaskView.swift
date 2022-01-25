//
//  TaskView.swift
//  todoapp
//
//  Created by Fatih Kilit on 24.01.2022.
//

import SwiftUI

struct TaskView: View {
    
    @EnvironmentObject var vm: CoreDataViewModel
    @State var list: ListEntity
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            AddTaskView(list: $list)
            
            if vm.tasks.isEmpty {
                
                NoTasksView()
                    .transition(AnyTransition.opacity.animation(.linear))
                
                Spacer()
            }
            else {
                List {
                    ForEach(vm.tasks) { task in
                        HStack {
                            Image(systemName: task.isDone ? "checkmark.circle" : "circle")
                                .foregroundColor(task.isDone ? .green : .red)
                            
                            Text(task.title ?? "")
                                .foregroundColor(task.isDone ? .secondary : .primary)
                                .strikethrough(task.isDone, color: .primary)
                        }
                        .onTapGesture {
                            withAnimation(.linear) {
                                vm.updateTask(task: task, forList: list)
                            }
                        }
                    }
                    .onDelete { indexSet in
                        vm.deleteTask(indexSet: indexSet, forList: list)
                    }
                }
                .animation(Animation.linear, value: vm.tasks.count)
                .transition(AnyTransition.opacity.animation(.linear))
            }
            
        }
        .navigationBarTitle(list.title ?? "")
        .onAppear {
            vm.getTasks(forList: list)
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TaskView(list: ListEntity(context: CoreDataViewModel().manager.context))
                .preferredColorScheme(.dark)
                .environmentObject(CoreDataViewModel())
        }
        .preferredColorScheme(.dark)
    }
}


