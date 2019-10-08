//
//  ContentViewController.swift
//  NewsDesign
//
//  Created by Samira.Marassy on 10/8/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    @IBOutlet weak var myImage: UIImageView!
     var myPage : Page?
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        if let p = myPage{
            myImage.image = UIImage(named: p.imageName)
        }
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
