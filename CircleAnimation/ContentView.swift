//
//  ContentView.swift
//  CircleAnimation
//
//  Created by ARMSTRONG on 3/7/23.
//

import SwiftUI

struct ContentView: View {
    @State var fill : Double = 0.0
    
    var body: some View {
        ZStack {
            Color(UIColor(red: 11/255.0, green: 25/225.0, blue: 128/225.0, alpha: 1))
            
            ZStack {
                // Track cicle
                Circle()
                    .stroke(Color.white.opacity(0.3),
                            style: StrokeStyle(lineWidth: 30))
                
                // Animation cicle
                Circle()
                    .trim(from: 0, to: CGFloat(self.fill))
                    .stroke(Color.yellow,
                            style: StrokeStyle(lineWidth: 30))
                    .rotationEffect(.init(degrees: -90))
                    .animation(Animation.linear(duration: 0.5))
                
                Text("$\(Int(self.fill * 100.0))")
                    .foregroundColor(Color.white)
                    .font(.system(size: 52))
            }
            .padding(20)
            
        }
        .onTapGesture {
            for x in 0..<100 {
                DispatchQueue.main.asyncAfter(deadline: .now()+TimeInterval(x/10)) {
                    self.fill += 0.01
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
