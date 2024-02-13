//
//  Home.swift
//  CarouselSlider_4
//
//  Created by Omid Shojaeian Zanjani on 13/02/24.
//

import SwiftUI

struct Home: View {
    @State private var cards:[Card] = [
        .init(image: "Profile 1"),
        .init(image: "Profile 2"),
        .init(image: "Profile 3"),
        .init(image: "Profile 4"),
        .init(image: "Profile 5"),
        .init(image: "Profile 6"),
        .init(image: "Profile 7"),
        .init(image: "Profile 8"),
        .init(image: "Profile 1"),
        .init(image: "Profile 2"),
        .init(image: "Profile 3"),
        .init(image: "Profile 4"),
        .init(image: "Profile 5"),
        .init(image: "Profile 6"),
        .init(image: "Profile 7"),
        .init(image: "Profile 8"),
        .init(image: "Profile 1"),
        .init(image: "Profile 2"),
        .init(image: "Profile 3"),
        .init(image: "Profile 4"),
        .init(image: "Profile 5"),
        .init(image: "Profile 6"),
        .init(image: "Profile 7"),
        .init(image: "Profile 8"),
        .init(image: "Profile 1"),
        .init(image: "Profile 2"),
        .init(image: "Profile 3"),
        .init(image: "Profile 4"),
        .init(image: "Profile 5"),
        .init(image: "Profile 6"),
        .init(image: "Profile 7"),
        .init(image: "Profile 8"),
    ]
    @State var widthAmont:CGFloat = 130
    
    var body: some View {
        VStack {
            Text("\(widthAmont)")
            Slider(value: $widthAmont, in: 60...180)
            .padding()

            GeometryReader{
                let size = $0.size
                
                ScrollView(.horizontal) {
                    HStack(spacing:10){
                        ForEach(cards){ item in
                            Cell(item)
                        }
                    }
                    .padding(.trailing, size.width - 180)
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned)
                .scrollIndicators(.hidden)
                .clipShape(.rect(cornerRadius: 25))
            }
            .padding(.horizontal, 15)
            .padding(.top, 20)
            .frame(height: 210)
        }
        .navigationTitle("CaroselSlider")
        Spacer()
    }
    
    // ⚠️ if I want to know the all width of Scrolview content ❓
    // ⚠️ how change something into progress value ❓
    
    @ViewBuilder
     func Cell(_ card:Card)-> some View {
        GeometryReader { proxy in
            
            let size = proxy.size
            let minX = proxy.frame(in: .scrollView).minX
            let reducingWidth = (minX / 190) * widthAmont
            let cappedWidth = min(reducingWidth, widthAmont)
            
            let frameWidth = size.width - (minX > 0 ? cappedWidth:-cappedWidth)
            //let _ = print(frameWidth)
            Image(card.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.height)
                .frame(width: frameWidth < 0 ? 0:frameWidth)
                .clipShape(.rect(cornerRadius: 25))
                .offset(x: minX > 0 ? 0:-cappedWidth)
                .offset(x: -card.previuosOffset)
        }// GeometryReader
        .frame(width: 180, height: 200)
        .offsetX { offSet in
            let reducingWidth = (offSet / 190) * widthAmont
            let index = cards.indexOf(card)
            
            if cards.indices.contains(index + 1 ) {
                cards[index + 1].previuosOffset = (offSet < 0 ? 0: reducingWidth)
            }
        }
        
    }// View
}

#Preview {
    ContentView()
}
