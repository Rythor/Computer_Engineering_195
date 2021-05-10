//
//  ContentView.swift
//  SplashScreen
//
//  Created by Brandon Cheu on 2/20/21.
//

import SwiftUI

struct SplashScreen: View {
    @State var animate = false
    @State var endSplash  = false
    @State var isActive: Bool = false
    var body: some View {
        ZStack{
            if self.isActive{
                TWSTabView()
            }
            else{
            ZStack{
                Color("launchScreenbackground")
                Image("TWSlarge")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fill:  .fit)
                    .frame(width: animate ? nil: 85, height: animate ? nil:  85)
                    .scaleEffect(animate ? 0.2:1)
                    .frame(width: UIScreen.main.bounds.width)
            }
            
            .ignoresSafeArea(.all, edges:.all)
            .onAppear(perform:animateSplash)
            .opacity(endSplash ? 0 : 1)
            }
        }
        
    }


func animateSplash(){
    DispatchQueue.main.asyncAfter(deadline: .now() + 1){
        withAnimation(Animation.easeOut(duration: 0.75)){
            animate.toggle()
        }
        withAnimation(Animation.linear(duration: 0.75)){
            endSplash.toggle()
            self.isActive = true;
        }
    }
}
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}

