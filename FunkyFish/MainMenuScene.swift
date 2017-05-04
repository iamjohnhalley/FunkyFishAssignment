//
//  MainMenuScene.swift
//  FunkyFish
//
//  Created by John on 04/05/2017.
//  Copyright © 2017 John. All rights reserved.
//

import SpriteKit

class MainMenuScene: SKScene {
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      
        for touch in touches {
            let location = touch.location(in: self);
            
            if atPoint(location).name == "start" {
                if let scene = GameplaySceneClass(fileNamed: "GameplayScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    
                    // Present the scene
                    view!.presentScene(scene, transition: SKTransition.crossFade(withDuration: 2))
                }
                
            }
        }
    }

} //class
