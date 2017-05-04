//
//  Player.swift
//  FunkyFish
//
//  Created by John on 04/05/2017.
//  Copyright © 2017 John. All rights reserved.
//

import SpriteKit

class Player: SKSpriteNode {
    
    private var minX = CGFloat(-182.375), maxX = CGFloat(182.375);
    
    func move(left: Bool) {
        
        if left {
            
            position.x -= 15;
            
            if position.x < minX {
                position.x = minX;
            }
            
        } else {
            position.x += 15;
            
            if position.x > maxX {
                position.x = maxX;
            }
        }
        
    }
    
    
} // class
