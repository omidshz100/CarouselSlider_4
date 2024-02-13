//
//  OffsetReader.swift
//  CarouselSlider_4
//
//  Created by Omid Shojaeian Zanjani on 13/02/24.
//

import Foundation
import SwiftUI



struct OffsetReader: PreferenceKey  {
    static var defaultValue: CGFloat = .zero
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

extension View {
    @ViewBuilder
    func offsetX(completion: @escaping (CGFloat)->Void) -> some View {
        self
            .overlay {
                GeometryReader{
                    let minX = $0.frame(in: .scrollView).minX
                    
                    Color.clear
                        .preference(key: OffsetReader.self, value: minX)
                        .onPreferenceChange(OffsetReader.self , perform: { value in
                            completion(value)
                        })
                }
            }
    }
}


extension [Card] {
    func indexOf(_ card:Card)->Int {
        self.firstIndex(of: card) ?? 0
    }
}
