//
//  ViewController.swift
//  NewsDesign
//
//  Created by Samira.Marassy on 10/2/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        profileImage.layer.borderWidth = 1.0
        profileImage.layer.masksToBounds = false
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.clipsToBounds = true
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
