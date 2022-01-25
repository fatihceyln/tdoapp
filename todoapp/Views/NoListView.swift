//
//  NoListView.swift
//  todoapp
//
//  Created by Fatih Kilit on 24.01.2022.
//

import SwiftUI

struct NoListView: View {
    @State var animate: Bool = false
    
    var body: some View {
        VStack {
            Text("There are no lists!")
                .font(.title)
                .bold()
                .padding(.bottom, 30)
                .scaleEffect(animate ? 1.1 : 1.0)
            
            Text("To be organized, list are exactly what we're looking for. Let's create a list.")
                .multilineTextAlignment(.center)
                .font(.title2)
                .padding(.horizontal)
        }
        .padding(40)
        .onAppear(perform: addAnimation)
    }
    
    func addAnimation() {
        guard !animate else {return} // if animate is true, then exit from this func.
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
                
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoListView_Previews: PreviewProvider {
    static var previews: some View {
        NoListView()
    }
}
