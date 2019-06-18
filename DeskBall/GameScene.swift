//
//  GameScene.swift
//  DeskBall
//
//  Created by shuxia on 2019/6/17.
//  Copyright © 2019 MK. All rights reserved.
//

import SpriteKit
import GameplayKit
struct  PhysicsCategory {
    // static let BulletRed :UInt32 = 0x1 << 1 // Alien的子弹
    static let player:UInt32 = 0x1 << 2
    static let npc     :UInt32 = 0x1 << 3
    static let hole :UInt32 = 0x1 << 4
}

class GameScene: SKScene ,SKPhysicsContactDelegate{
    
    
    var playerNode :SKSpriteNode!
    var stepNumber = 0
    

    
    let holeName   = "hole"
    let playerName = "player"
    let npcName    = "npc"

    let npcItemSize = CGSize(width: 50, height: 50)
    
    
    
    override func didMove(to view: SKView) {
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)  /// 物理世界的重力
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsWorld.contactDelegate = self;

        
        createBackNode()
        createPLayer()
        createHole()
        createNpc()
    }
    //:创建背景
    func createBackNode()  {
        let backNode = SKSpriteNode(texture: SKTexture(imageNamed: "DeskBack"), size: CGSize(width: 1024, height: 1024))
        backNode.position = CGPoint(x: view!.frame.width/2, y: view!.frame.height/2)
        backNode.zPosition = -1
        addChild(backNode)
    }
    //:创建 plaer
    func createPLayer()  {
        playerNode = SKSpriteNode(texture: SKTexture(imageNamed: "player"), size: npcItemSize)
        playerNode.position = CGPoint(x: view!.frame.width/2, y: view!.frame.height/2)
        addChild(playerNode)
        //:创建 physicalBody
        playerNode.physicsBody = SKPhysicsBody(texture: playerNode.texture!, size: playerNode.size)
        playerNode.physicsBody?.allowsRotation = true  //禁止旋转
        playerNode.physicsBody?.categoryBitMask = PhysicsCategory.player
        playerNode.physicsBody?.contactTestBitMask = PhysicsCategory.npc | PhysicsCategory.hole
        playerNode.physicsBody?.isDynamic = true

    }
    //:创建 hole
    func createHole()  {
        
        let holeNode0 = SKSpriteNode(texture: SKTexture(imageNamed: "hole"), size: npcItemSize)
        holeNode0.position = CGPoint(x: 25, y: 25)
        holeNode0.name     = holeName
        addChild(holeNode0)
        
        let holeNode1 = SKSpriteNode(texture: SKTexture(imageNamed: "hole"), size: npcItemSize)
        holeNode1.position = CGPoint(x: view!.frame.width - 25, y: 25)
        holeNode1.name     = ""
        addChild(holeNode1)
        
        let holeNode2 = SKSpriteNode(texture: SKTexture(imageNamed: "hole"), size: npcItemSize)
        holeNode2.position = CGPoint(x: 25, y: view!.frame.height - 25)
        holeNode2.name     = holeName
        addChild(holeNode2)

        let holeNode3 = SKSpriteNode(texture: SKTexture(imageNamed: "hole"), size: npcItemSize)
        holeNode3.position = CGPoint(x: view!.frame.width - 25, y: view!.frame.height - 25)
        holeNode3.name     = holeName
        addChild(holeNode3)
        
        //:创建 physicalBody
        holeNode0.physicsBody = SKPhysicsBody(texture: holeNode0.texture!, size: holeNode0.size)
        holeNode0.physicsBody?.allowsRotation = false  //禁止旋转
        holeNode0.physicsBody?.categoryBitMask = PhysicsCategory.hole
        holeNode0.physicsBody?.contactTestBitMask = PhysicsCategory.npc | PhysicsCategory.player
        holeNode0.physicsBody?.isDynamic = false

        holeNode1.physicsBody = SKPhysicsBody(texture: holeNode1.texture!, size: holeNode1.size)
        holeNode1.physicsBody?.allowsRotation = false  //禁止旋转
        holeNode1.physicsBody?.categoryBitMask = PhysicsCategory.hole
        holeNode1.physicsBody?.contactTestBitMask = PhysicsCategory.npc | PhysicsCategory.player
        holeNode1.physicsBody?.isDynamic = false

        holeNode2.physicsBody = SKPhysicsBody(texture: holeNode2.texture!, size: holeNode2.size)
        holeNode2.physicsBody?.allowsRotation = false  //禁止旋转
        holeNode2.physicsBody?.categoryBitMask = PhysicsCategory.hole
        holeNode2.physicsBody?.contactTestBitMask = PhysicsCategory.npc | PhysicsCategory.player
        holeNode2.physicsBody?.isDynamic = false

        holeNode3.physicsBody = SKPhysicsBody(texture: holeNode3.texture!, size: holeNode3.size)
        holeNode3.physicsBody?.allowsRotation = false  //禁止旋转
        holeNode3.physicsBody?.categoryBitMask = PhysicsCategory.hole
        holeNode3.physicsBody?.contactTestBitMask = PhysicsCategory.npc | PhysicsCategory.player
        holeNode3.physicsBody?.isDynamic = false


    }
    //:创建 npc
    
    func createNpc()  {

        for index in 1...5 {
          let npcNode = SKSpriteNode(texture: SKTexture(imageNamed: "npc"), size: npcItemSize)
            npcNode.position = CGPoint(x: view!.frame.width/2, y: CGFloat(50*index))
            npcNode.name     = npcName
            addChild(npcNode)
            npcNode.physicsBody = SKPhysicsBody(texture: npcNode.texture!, size: npcNode.size)
            npcNode.physicsBody?.allowsRotation = true  //禁止旋转
            npcNode.physicsBody?.categoryBitMask = PhysicsCategory.npc
            npcNode.physicsBody?.contactTestBitMask = PhysicsCategory.hole | PhysicsCategory.player
            npcNode.physicsBody?.isDynamic = true
            npcNode.physicsBody?.friction  = 1.0


        }
        for index in 1...5 {
            let npcNode = SKSpriteNode(texture: SKTexture(imageNamed: "npc"), size: npcItemSize)
            npcNode.position = CGPoint(x: view!.frame.width/2, y:view!.frame.height - CGFloat(50*index))
            npcNode.name     = npcName
            addChild(npcNode)
            npcNode.physicsBody = SKPhysicsBody(texture: npcNode.texture!, size: npcNode.size)
            npcNode.physicsBody?.allowsRotation = true  //禁止旋转
            npcNode.physicsBody?.categoryBitMask = PhysicsCategory.npc
            npcNode.physicsBody?.contactTestBitMask = PhysicsCategory.hole | PhysicsCategory.player
            npcNode.physicsBody?.isDynamic = true
            npcNode.physicsBody?.friction  = 1.0
            
        }
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        guard let touch = touches.first else {
            return
        }
        let touchLocation = touch.location(in: self)
        playerNode.physicsBody?.applyImpulse(CGVector(dx: touchLocation.x - playerNode.position.x, dy: touchLocation.y - playerNode.position.y))
        stepNumber += 1
    }

    
    func didBegin(_ contact: SKPhysicsContact) {
        var bodyA : SKPhysicsBody
        var bodyB : SKPhysicsBody
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask{
            bodyA = contact.bodyA
            bodyB = contact.bodyB
        }else {
            bodyA = contact.bodyB
            bodyB = contact.bodyA
        }
        if bodyA.categoryBitMask == PhysicsCategory.npc && bodyB.categoryBitMask == PhysicsCategory.hole{
            print("球进了")
            bodyA.node?.removeFromParent()
        }
        if bodyA.categoryBitMask == PhysicsCategory.hole && bodyB.categoryBitMask == PhysicsCategory.npc{
            print("球进了")
            bodyB.node?.removeFromParent()
        }
        if bodyA.categoryBitMask == PhysicsCategory.hole && bodyB.categoryBitMask == PhysicsCategory.player{
            print("你输了")
            bodyB.node?.removeFromParent()
            self.jumpScen()
        }
        if bodyA.categoryBitMask == PhysicsCategory.player && bodyB.categoryBitMask == PhysicsCategory.hole{
            print("你输了")
            bodyA.node?.removeFromParent()
            self.jumpScen()
        }

    }
    //:输了就直接跳页面

    func jumpScen()  {
        let reveal = SKTransition.moveIn(with: SKTransitionDirection.down, duration: 0.5)
        let mainScene = OverScene(size: self.size)
        mainScene.scaleMode = .aspectFill
        mainScene.allNumberStep = stepNumber
        self.view?.presentScene(mainScene, transition: reveal)
    }
    
    
    
}
