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
    
    func initializePlayer() {
        name = "Player";
        
        physicsBody = SKPhysicsBody(circleOfRadius: size.height / 2);
        physicsBody?.affectedByGravity = false;
        physicsBody?.isDynamic = false;
        physicsBody?.contactTestBitMask = ColliderType.FOOD_AND_BOMB;
        
    }
    
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
