//
//  UserViewController.swift
//  DeskBall
//
//  Created by shuxia on 2019/6/19.
//  Copyright © 2019 MK. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    var user = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        let imageView = UIWebView.init(frame: view.bounds)
        imageView.backgroundColor = UIColor.white
        
        view.addSubview(imageView)
        
        let imageUrl  = URL.init(string: user)
        
        let imageResource = URLRequest.init(url: imageUrl!)
        
        imageView.loadRequest(imageResource)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
