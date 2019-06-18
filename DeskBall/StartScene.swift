//
//  StartScene.swift
//  DeskBall
//
//  Created by shuxia on 2019/6/17.
//  Copyright © 2019 MK. All rights reserved.
//

import SpriteKit
import GameplayKit

class StartScene: SKScene {
    
    var startBtn :SKSpriteNode!
    
    override func didMove(to view: SKView) {
        createBackNode()
        createStartBtn()
    }
    //:创建背景
    func createBackNode()  {
        let scale = view!.frame.height/1535
        let backNode = SKSpriteNode(texture: SKTexture(imageNamed: "startScene.jpg"), size: CGSize(width: 1024*scale, height: view!.frame.height))
        backNode.position = CGPoint(x: view!.frame.width/2, y: view!.frame.height/2)
        backNode.zPosition = -1
        addChild(backNode)
    }
    //:创建开始按钮
    func createStartBtn()  {
        startBtn = SKSpriteNode(texture: SKTexture(imageNamed: "startBtn"), size: CGSize(width: 150, height: 150))
        startBtn.position = CGPoint(x: view!.frame.width/2, y: 80)
        addChild(startBtn)
        createRotation()
    }
    //:创建旋转动作
    func createRotation()  {
//        SKAction *rotateAction = [SKAction rotateByAngle:M_PI*2 duration:0.3];
//
//        [windmillNode runAction:rotateAction];
        let rorationA = SKAction.rotate(byAngle: CGFloat(Double.pi*2), duration: 1.5)
        startBtn.run(SKAction.repeatForever(rorationA))
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touch = touches.first else {
            return
        }
        let touchLocation = touch.location(in: self)
    
        if startBtn.contains(touchLocation) {
            let reveal = SKTransition.doorway(withDuration: 0.5)
            let mainScene = GameScene(size: self.size)
            mainScene.scaleMode = .aspectFill
            self.view?.presentScene(mainScene, transition: reveal)

        }
    }
}
