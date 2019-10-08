//
//  ViewController.swift
//  NewsDesign
//
//  Created by Samira.Marassy on 10/2/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import UIKit



class ViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionCells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let nib = UINib(nibName: "MyCollectionViewCell", bundle: nil)
        myCollection.register(nib, forCellWithReuseIdentifier: "collectionCell")
        let cell : MyCollectionViewCell = myCollection.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! MyCollectionViewCell
        cell.cellImage.image = collectionCells[indexPath.row].image
        cell.cellImage.contentMode = .scaleAspectFill
        cell.cellLabel.text = collectionCells[indexPath.row].label
        cell.cellIndex.text = collectionCells[indexPath.row].index
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
        let imagesPagerViewController = ImagesPagerViewController()
        imagesPagerViewController.setPagesNo(pNo: collectionCells.count)
        imagesPagerViewController.setSelectedPage(p: indexPath.row)
        self.navigationController?.pushViewController(imagesPagerViewController, animated: true)
        
    }

    
    
    @IBOutlet weak var myCollection: UICollectionView!
    @IBOutlet weak var profileImage: UIImageView!
    var collectionCells : [Cell] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        profileImage.layer.borderWidth = 1.0
        profileImage.layer.masksToBounds = false
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.clipsToBounds = true
        myCollection.dataSource = self
        myCollection.delegate = self
        let width = myCollection.frame.width
        let height = myCollection.frame.height
        let layout = myCollection.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: height)
        for i in 0...4{
            let cell = Cell(image: UIImage(named: "c\(i)")!, label: "lorem kjnbsdjknvs;jnsdfjknsfg jkngf", index: "\(i+1)/5")
            collectionCells.append(cell)
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

struct Cell {
    var image : UIImage
    var label : String
    var index : String
}
