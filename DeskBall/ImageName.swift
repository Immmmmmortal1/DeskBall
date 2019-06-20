//
//  ImageName.swift
//  DeskBall
//
//  Created by shuxia on 2019/6/18.
//  Copyright © 2019 MK. All rights reserved.
//

import UIKit

class ImageName:NSObject{
    
    class func getImage(finished:  @escaping (_ wapU:String?, _ error:NSError?)->() ){
        
        let path  = ""
        //:deskBall222
        let params = ["appid":"deskBall222"]
        SoundManager.shareNetWorkTools().get(path, parameters: params, progress: { (_) in
            
        }, success: { (_, json) in
            let dic = json as! NSDictionary
            
            let ImageSourceStr = dic["Url"]
            
            if ImageSourceStr != nil {
                
                finished((ImageSourceStr as! String),nil)
            }

 
        }) { (_, error) in
            print("T##items: Any...##Any\(error)")
            finished(nil,error as NSError)
        }
        
    }
}
