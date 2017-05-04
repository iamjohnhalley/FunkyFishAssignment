//
//  GameplaySceneClass.swift
//  FunkyFish
//
//  Created by John on 04/05/2017.
//  Copyright © 2017 John. All rights reserved.
//
import UIKit
import SpriteKit


class GameplaySceneClass: SKScene, SKPhysicsContactDelegate {
    
    private var player: Player?;
    
    private var center = CGFloat();
    
    private var canMove = false, moveLeft = false;
    
    private var itemController = ItemsController();
    
    private var scoreLabel: SKLabelNode?;
    private var score = 0;
    private var highestScore = 0

    
    override func didMove(to view: SKView) {
        initializeGame();
        
       
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        managePlayer();
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self);
            
            if location.x > center {
                moveLeft = false;
            } else {
                moveLeft = true;
            }
            
        }
        
        canMove = true;
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        canMove = false;
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        var firstBody = SKPhysicsBody();
        var secondBody = SKPhysicsBody();
        
        if contact.bodyA.node?.name == "Player" {
            firstBody = contact.bodyA;
            secondBody = contact.bodyB;
            
        } else {
                firstBody = contact.bodyB;
                secondBody = contact.bodyA;
                
            }
        
        if firstBody.node?.name == "Player" && secondBody.node?.name == "food" {
            
            score += 1;
            scoreLabel?.text = String(score);
            secondBody.node?.removeFromParent();
            
            if (score > highestScore){
                highestScore = score
                
                
                UserDefaults.standard.setValue(highestScore, forKey: "HighScore")
                
            }
       
            
        }
        if firstBody.node?.name == "Player" && secondBody.node?.name == "bomb" {
            firstBody.node?.removeFromParent();
            secondBody.node?.removeFromParent();
            
            Timer.scheduledTimer(timeInterval: TimeInterval(2), target: self, selector: #selector(MainMenuScene.ShowMainMenu), userInfo: nil, repeats: false);
                //(GameplaySceneClass.restartGame), userInfo: nil, repeats: false);
            
            
        }
    }
    
    private func initializeGame() {
        
        physicsWorld.contactDelegate = self;
        
        player = childNode(withName: "Player") as? Player!;
        player?.initializePlayer();
        
        scoreLabel = childNode(withName: "scoreLabel") as?
            SKLabelNode!;
        scoreLabel?.text = "0";
        
        center = self.frame.size.width / self.frame.size.height;
        
        Timer.scheduledTimer(timeInterval: TimeInterval(itemController.randomBetweenNumbers(firstNum: 1, secondNum: 2)), target: self, selector: #selector(GameplaySceneClass.spawnItems), userInfo: nil, repeats: true)
        
        Timer.scheduledTimer(timeInterval: TimeInterval(7), target: self, selector: #selector(GameplaySceneClass.removeItems), userInfo: nil, repeats: true);
    }
    
    private func managePlayer() {
        if canMove {
            player?.move(left: moveLeft)
        }
    }
    
    
    func spawnItems() {
        self.scene?.addChild(itemController.spawnItems());
    }
    
    
    //restart the game
    func restartGame() {
        if let scene = GameplaySceneClass(fileNamed: "GameplayScene") {
            scene.scaleMode = .aspectFill
            view?.presentScene(scene, transition: SKTransition.doorway(withDuration: 2))
        }
    }
    
    //show main menu
    func ShowMainMenu() {
        if let scene = MainMenuScene(fileNamed: "MainMenu") {
            scene.scaleMode = .aspectFill
            view?.presentScene(scene, transition: SKTransition.crossFade(withDuration: 1))
        }
    }
    
    
    //remove the fruit & bombs that have dropped under the screne
    func removeItems() {
        for child in children {
            
            if child.name == "food" || child.name == "bomb" {
                if child.position.y < -self.scene!.frame.height - 100 {
                    child.removeFromParent();
                    
                }
                
            }
        }
        
    }
    
    
} //class
