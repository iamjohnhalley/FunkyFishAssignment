//
//  GameOverScene.swift
//  FunkyFish
//
//  Created by John on 22/05/2017.
//  Copyright © 2017 John. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

class GameOverScene: SKScene {
    
    private var myScoreLabel: SKLabelNode?;

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        
        for touch in touches {
            let location = touch.location(in: self);
            
            
            if atPoint(location).name == "startAgain" {
                if let scene = GameplaySceneClass(fileNamed: "GameplayScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    
                    // Present the scene
                    view!.presentScene(scene, transition: SKTransition.crossFade(withDuration: 2))
                }
                
            }
        
        
        if atPoint(location).name == "mainMenu" {
            if let scene = MainMenuScene(fileNamed: "MainMenu") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view!.presentScene(scene, transition: SKTransition.push(with: .down, duration: 2))
            }
        }
            
        }
    

    
    }

    //show main menu
    func ShowMainMenu() {
        if let scene = MainMenuScene(fileNamed: "mainMenu") {
            scene.scaleMode = .aspectFill
            view?.presentScene(scene, transition: SKTransition.crossFade(withDuration: 1))
        }
    }
    func ShowGameOverScene() {
        if let scene = GameOverScene(fileNamed: "GameOver") {
            scene.scaleMode = .aspectFill
            view?.presentScene(scene, transition: SKTransition.crossFade(withDuration: 1))
        }
    }

}
