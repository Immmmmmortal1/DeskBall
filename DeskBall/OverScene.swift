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
    
    override func didMove(to view: SKView) {
        
        
        createBackNode()
        
    }
    
    //:创建背景
    func createBackNode()  {
        let scale = view!.frame.height/1535
        let backNode = SKSpriteNode(texture: SKTexture(imageNamed: "DeskBack"), size: CGSize(width: 1024*scale, height: view!.frame.height))
        backNode.position = CGPoint(x: view!.frame.width/2, y: view!.frame.height/2)
        backNode.zPosition = -1
        addChild(backNode)
    }
}
