//
//  PageViewController.swift
//  Vamos Pages
//
//  Created by Mauri C. on 26/12/14.
//  Copyright (c) 2014 WANT. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    var myViewControllers : [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.delegate = self
        self.dataSource = self
        
        let p1 = storyboard?.instantiateViewControllerWithIdentifier("a") as aViewController
        let p2 = storyboard?.instantiateViewControllerWithIdentifier("b") as bViewController
        
        myViewControllers = [p1,p2]
        
        
        for var index = 0; index < myViewControllers.count; ++index {
            NSLog("\(myViewControllers[index])")
        }
        
        let startingViewController = self.viewControllerAtIndex(0)
        let viewControllers: NSArray = [startingViewController]
        
        self.setViewControllers(viewControllers, direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: {(done: Bool) in
        })
        
        NSLog("loaded!");
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Private Function
    func viewControllerAtIndex (index: NSInteger) -> UIViewController{
        return myViewControllers[index]
    }
    
    //Delegates and Datasource
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
       
        NSLog("Entered to BeforeViewController")
        
        var index = find(myViewControllers, viewController)!
        NSLog("\(index)")
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        index--
        if index == myViewControllers.count {
            return nil
        }
        NSLog("\(index)")
        return self.viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
         NSLog("Entered to BeforeViewController")

        var index = find(myViewControllers, viewController)!
        NSLog("\(index)")
        if index == NSNotFound {
            return nil
        }
        index++
        if index == myViewControllers.count {
            return nil
        }
        NSLog("\(index)")
        return self.viewControllerAtIndex(index)

    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return myViewControllers.count
    }

    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    
    
    

}
