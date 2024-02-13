//
//  Card.swift
//  CarouselSlider_4
//
//  Created by Omid Shojaeian Zanjani on 13/02/24.
//

import Foundation


struct Card: Identifiable, Hashable, Equatable{
    var id:UUID  = UUID()
    var image:String
    var previuosOffset:CGFloat = 0
}




