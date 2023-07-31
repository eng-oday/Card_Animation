//
//  Card.swift
//  Gold_Card
//
//  Created by user on 31/07/2023.
//

import SwiftUI

struct Card: View {
    
    @State var rotation:CGFloat     = 0.0
    @State var isAnimated:Bool      = true
    @State var offset:CGSize        = .zero
    var body: some View {
        
        ZStack {
            Color("My")
            
            ZStack {
                            //1.  BLACK CONTAINER
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(width: 260 ,height: 340 )
                    .foregroundColor(.black)
                    .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 0)
                    .scaleEffect(isAnimated ? 5 : 1)
                    .rotationEffect(.degrees(isAnimated ? 360 : 0))

                
                    
                
                // 2 . TOP GRADIENT COLOR ON BLACK CONTAINER
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(width: 500 ,height: 200 )
                    .foregroundStyle(
                        LinearGradient(gradient: Gradient(colors: [.red,.orange,.yellow,.green,.blue,.purple,.pink]), startPoint: .top, endPoint: .bottom))
                    .rotationEffect(.degrees(rotation))
                
                //3 .  THE LINE IS MOVE ON BORDER
                    .mask {
                        RoundedRectangle(cornerRadius: 20,style: .continuous)
                            .stroke(lineWidth: 3)
                            .frame(width: 260, height: 340)
                            .blur(radius: 1.5)
                    }
                    .scaleEffect(isAnimated ? 5 : 1)
                            
                //4 .TEXT ON CONTAINER
                Text("SwiftUI")
                    .foregroundColor(.white)
                    .font(.system(size: 50))
                    .fontWeight(.black)
                    .blur(radius: isAnimated ? 5 : 0)
                    .scaleEffect(isAnimated ? 5 : 1)
                    .rotationEffect(.degrees(isAnimated ? 360 : 0))
                
            }
            
            // DRAG GESTUR ON ALL STACK
            .offset(offset)
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        withAnimation(.easeOut(duration: 4)) {
                            offset = value.translation
                        }
                    })
                    .onEnded({ _ in
                        
                        withAnimation(.easeIn(duration: 1)) {
                            offset = .zero
                        }
                    })
                )
        }

        .ignoresSafeArea()
        .onAppear{
            withAnimation(.linear(duration: 7).repeatForever(autoreverses: false)) {
                    rotation = 360
            }
            withAnimation(.easeOut(duration: 2)) {
                isAnimated = false
            }
            
        }
        
        
    }
}

//struct Card_Previews: PreviewProvider {
//    static var previews: some View {
//        Card()
//    }
//}
