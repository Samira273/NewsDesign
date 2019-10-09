//
//  ImagesPagerViewController.swift
//  NewsDesign
//
//  Created by Samira.Marassy on 10/8/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import UIKit

class ImagesPagerViewController: UIViewController, UIPageViewControllerDataSource {
    
    var pageViewController: UIPageViewController!
    private var myPages = [Page]()
    private var noOfPages : Int?
    private var selectedPage : Int?
    
    func setPagesNo(pNo : Int){
        noOfPages = pNo
    }
    
    func setSelectedPage(p:Int){
        selectedPage = p
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let range = noOfPages{
            for i in 0 ..< range{
                myPages.append(Page(pageNo: i, imageName: "c\(i)"))
            }
        }
        let pc = UIPageControl.appearance()
        pc.pageIndicatorTintColor = UIColor.lightGray
        pc.currentPageIndicatorTintColor = UIColor.black
        pc.backgroundColor = UIColor.white
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageViewController.dataSource = self
        self.restartAction()
        self.addChild(self.pageViewController)
        let views = [
            "pg": self.pageViewController.view,
            //            "btn": btn,
        ]
        for (_, v) in views {
            if let view = v{
                view.translatesAutoresizingMaskIntoConstraints = false
                self.view.addSubview(view)
            }
        }
        
        //        NSLayoutConstraint.activateConstraints(
        //            [NSLayoutConstraint(
        ////                item: btn,
        //                attribute: .CenterX,
        //                relatedBy: .Equal,
        //                toItem: self.view,
        //                attribute: .CenterX,
        //                multiplier: 1,
        //                constant: 0),
        //                ] +
        //                NSLayoutConstraint.constraintsWithVisualFormat("H:|[pg]|",               options: .AlignAllCenterX, metrics: [:], views: views) +
        //                NSLayoutConstraint.constraintsWithVisualFormat("V:|-30-[pg]-[btn]-15-|", options: .AlignAllCenterX, metrics: [:], views: views)
        //        )
        // self.pageViewController.didMove(toParent: self)
        
    }
    func restartAction() {
        self.pageViewController.setViewControllers([self.viewControllerAtIndex(index: selectedPage ?? 0)], direction: .forward, animated: true, completion: nil)
    }
    
    func viewControllerAtIndex(index: Int) -> ContentViewController {
        if (myPages.count == 0) || (index >= myPages.count) {
            return ContentViewController(nibName: "ContentViewController", bundle: nil)
        }
        let vc = ContentViewController(nibName: "ContentViewController", bundle: nil)
        vc.myPage = myPages[index]
        return vc
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return myPages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return selectedPage ?? 0
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! ContentViewController
        guard let index = vc.myPage?.pageNo else{
            return nil
        }
        if (index == 0 || index == NSNotFound) {
            return nil
        }
        return self.viewControllerAtIndex(index: index-1)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! ContentViewController
        guard let index = vc.myPage?.pageNo else{
            return nil
        }
        if (index == NSNotFound) {
            return nil
        }
        let next = index + 1
        if (next == myPages.count) {
            return nil
        }
        return self.viewControllerAtIndex(index: next)
    }
    
}

struct Page {
    var pageNo : Int
    var imageName: String
}

