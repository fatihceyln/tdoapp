//
//  AddListView.swift
//  todoapp
//
//  Created by Fatih Kilit on 25.01.2022.
//

import SwiftUI

struct AddListView: View {
    
    @State var titleTextField: String = ""
    @EnvironmentObject var vm: CoreDataViewModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            TextField("Type something...", text: $titleTextField, prompt: .none)
                .foregroundColor(Color.white)
                .padding()
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.secondary.opacity(0.3))
                .frame(maxWidth: .infinity)
                .cornerRadius(10)
            
            Button {
                vm.addList(titleForList: titleTextField)
                titleTextField = ""
                
            } label: {
                Text("SAVE")
                    .foregroundColor(.white)
                    .font(.headline)
                    .bold()
                    .frame(height: 55)
                    .padding(.horizontal)
                    .background(Color.pink)
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal)
    }
}
