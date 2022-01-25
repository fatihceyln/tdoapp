//
//  ContentView.swift
//  todoapp
//
//  Created by Fatih Kilit on 24.01.2022.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var vm: CoreDataViewModel
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                AddListView()
                
                if vm.lists.isEmpty {
                    NoListView()
                        .transition(AnyTransition.opacity.animation(.linear))
                    Spacer()
                }
                else {
                    List{
                        ForEach(vm.lists) { list in
                            NavigationLink {
                                TaskView(list: list)
                            } label: {
                                Text(list.title ?? "")
                            }
                        }
                        .onDelete { indexSet in
                            vm.deleteList(indexSet: indexSet)
                        }
                    }
                    .animation(Animation.linear, value: vm.lists.count)
                    .transition(AnyTransition.opacity.animation(.linear))
                    
                }
            }
            .navigationBarTitle("Lists")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .preferredColorScheme(.dark)
            .environmentObject(CoreDataViewModel())
    }
}
