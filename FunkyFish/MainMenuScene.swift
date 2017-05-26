//
//  MainMenuScene.swift
//  FunkyFish
//
//  Created by John on 04/05/2017.
//  Copyright © 2017 John. All rights reserved.
//
import UIKit
import SpriteKit

class MainMenuScene: SKScene {
    
     private var highScore: SKLabelNode?;
     private var myScore = String("0")
     private var player: Player?;
   
    
  
   
    
    
    override func didMove(to view: SKView) {
        
        if (myScore == nil){
            
            highScore!.text = "0"
            
            print("score is 0")

       
        } else {
            
             self.myScore = ("\(UserDefaults.standard.value(forKey: "HighScore")!)")
            
            
            highScore = childNode(withName: "highScore") as?
                SKLabelNode!;
            highScore!.text = myScore
            print(counter,"this is counting")
         }
        
       
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
       
      
        for touch in touches {
            let location = touch.location(in: self);
            
            if atPoint(location).name == "start" {
                if let scene = GameplaySceneClass(fileNamed: "GameplayScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    
                    // Present the scene
                    view!.presentScene(scene, transition: SKTransition.push(with: .up, duration: 2))  }
                
            }
        }
        
        for touch in touches {
            let location = touch.location(in: self);
            
            if atPoint(location).name == "sound" {
                
                self.run(SKAction.playSoundFileNamed("coin.wav", waitForCompletion: true))
                
            }
        }
        
        for touch in touches {
            let location = touch.location(in: self);
            
            if atPoint(location).name == "mute" {
               
                
                
            }
        }

        
    }
    
    //show main menu
    func ShowMainMenu() {
        if let scene = MainMenuScene(fileNamed: "MainMenu") {
            scene.scaleMode = .aspectFill
            view?.presentScene(scene, transition: SKTransition.crossFade(withDuration: 1))
        }
    }
    
    

} //class
