//
//  OverScene.swift
//  DeskBall
//
//  Created by shuxia on 2019/6/18.
//  Copyright © 2019 MK. All rights reserved.
//


import SpriteKit
import GameplayKit

class OverScene: SKScene {
    
    
    var allNumberStep :Int = 0
    var backGame:SKSpriteNode!
    
    
    override func didMove(to view: SKView) {
        
        createBackNode()
        createLabel()
        createBack()
        
    }
    
    //:创建背景
    func createBackNode()  {
        let scale = view!.frame.height/1535
        let backNode = SKSpriteNode(texture: SKTexture(imageNamed: "voerBack.jpg"), size: CGSize(width: 1024*scale, height: view!.frame.height))
        backNode.position = CGPoint(x: view!.frame.width/2, y: view!.frame.height/2)
        backNode.zPosition = -1
        addChild(backNode)
    }
    func createLabel()  {
        numberLabel.position = CGPoint(x: view!.frame.width/2, y: view!.frame.height/2 + 100)
        addChild(numberLabel)
    }
    //:创建 Label

    lazy var numberLabel :SKLabelNode = {
        let label = SKLabelNode(fontNamed: "Chalkduster")
        label.text = "总步数:" + String(allNumberStep)
        label.fontColor = UIColor.white
        return label
    }()
    
    //:创建背景
    func createBack()  {
        backGame = SKSpriteNode(texture: SKTexture(imageNamed: "fanhui"), size: CGSize(width: 100, height: 100))
        backGame.position = CGPoint(x: view!.frame.width/2, y: view!.frame.height/2)

        addChild(backGame)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touch = touches.first else {
            return
        }
        let touchLocation = touch.location(in: self)
        
        if backGame.contains(touchLocation) {
            let reveal = SKTransition.crossFade(withDuration: 0.5)
            let mainScene = GameScene(size: self.size)
            mainScene.scaleMode = .aspectFill
            self.view?.presentScene(mainScene, transition: reveal)
            
        }
    }


}
