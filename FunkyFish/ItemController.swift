//
//  ItemController.swift
//  FunkyFish
//
//  Created by John on 04/05/2017.
//  Copyright © 2017 John. All rights reserved.
//

import SpriteKit

struct ColliderType {
    static let PLAYER: UInt32 = 0;
    static let FOOD_AND_BOMB: UInt32 = 1;
   
    
    
}

    
    var counter: UInt = 0


class ItemsController{
    
    private var minX = CGFloat(-182.375), maxX = CGFloat(182.375);
    

    
    func spawnItems() -> SKSpriteNode {
        var item: SKSpriteNode?;
        
        
        
        if Int(randomBetweenNumbers(firstNum: 0, secondNum: 10)) >=
            6  {
            item = SKSpriteNode (imageNamed: "bomb");
            item!.name = "bomb";
            item!.setScale(0.3);
            item!.physicsBody = SKPhysicsBody(circleOfRadius: item!.size.height / 2);

        }
            
    
       else {
            
            let num = Int(randomBetweenNumbers(firstNum: 1, secondNum: 5));
            
            item = SKSpriteNode(imageNamed: "food \(num)");
            item!.name = "food";
            item!.setScale(0.2);
            item!.physicsBody = SKPhysicsBody(circleOfRadius: item!.size.height / 2);
            
        }
        

        
        item!.physicsBody?.categoryBitMask = ColliderType.FOOD_AND_BOMB;
        
        item!.zPosition = 3;
        item!.anchorPoint = CGPoint(x: 0.5, y: 0.5);
        
        item!.position.x = randomBetweenNumbers(firstNum: minX, secondNum: maxX);
        item!.position.y = 500;
        
        return item!;
    }
    
    
    func randomBetweenNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
        //return a random number between two numbers
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum);
        
    }
    
   
  
    
} // class
