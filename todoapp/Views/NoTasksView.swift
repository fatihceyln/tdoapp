//
//  NoTasksView.swift
//  todoapp
//
//  Created by Fatih Kilit on 24.01.2022.
//

import SwiftUI

struct NoTasksView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        VStack {
            Text("There are no tasks!")
                .font(.title)
                .bold()
                .padding(.bottom, 30)
                .scaleEffect(animate ? 1.1 : 1.0)
            
            Text("This place is empty like my ex's brain. Let's add some tasks here!")
                .multilineTextAlignment(.center)
                .font(.title2)
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

struct NoTasksView_Previews: PreviewProvider {
    static var previews: some View {
        NoTasksView()
            .preferredColorScheme(.dark)
    }
}
