//
//  WelcomePageViewController.swift
//  Week 2 Carousel
//
//  Created by Ngai, Sabrina on 8/28/16.
//  Copyright © 2016 Ngai, Sabrina. All rights reserved.
//

import UIKit

class WelcomePageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var pages = [UIViewController]()
    
    override func viewDidLoad() {
    super.viewDidLoad()
    
    self.delegate = self
    self.dataSource = self
    
    let page1: UIViewController! = storyboard?.instantiateViewControllerWithIdentifier("TutorialViewcontroller1")
    let page2: UIViewController! = storyboard?.instantiateViewControllerWithIdentifier("TutorialViewcontroller2")
    let page3: UIViewController! = storyboard?.instantiateViewControllerWithIdentifier("TutorialViewcontroller3")
    let page4: UIViewController! = storyboard?.instantiateViewControllerWithIdentifier("TutorialViewcontroller4")
    
    pages.append(page1)
    pages.append(page2)
    pages.append(page3)
    pages.append(page4)
    
    setViewControllers([page1], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
    
        let proxy: UIPageControl = UIPageControl.appearance()
        proxy.pageIndicatorTintColor = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1.0)
        proxy.currentPageIndicatorTintColor = UIColor(red: 44/255, green: 161/255, blue: 213/255, alpha: 1.0)
        
        //does not work. have to override viewDidLayoutSubviews. See code below
        //proxy.backgroundColor = UIColor.clearColor()

    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let currentIndex = pages.indexOf(viewController)!
        let previousIndex = abs((currentIndex - 1) % pages.count)
        
        //prevents from going ahead of 1st page. looping not allowed
        if currentIndex == 0 {
            return nil
        }
        
        return pages[previousIndex]
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let currentIndex = pages.indexOf(viewController)!
        let nextIndex = abs((currentIndex + 1) % pages.count)
        
        //prevents from going beyond last page. looping not allowed
        if currentIndex == pages.count - 1 {
            return nil
        }
        
        return pages[nextIndex]
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    //Clears out background color of UIPageControl. Override the viewDidLayoutSubviews() function to bring the page control to the front of the view.
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let subViews: NSArray = view.subviews
        var scrollView: UIScrollView? = nil
        var pageControl: UIPageControl? = nil
        
        for view in subViews {
            if view.isKindOfClass(UIScrollView) {
                scrollView = view as? UIScrollView
            }
            else if view.isKindOfClass(UIPageControl) {
                pageControl = view as? UIPageControl
            }
        }
        
        if (scrollView != nil && pageControl != nil) {
            scrollView?.frame = view.bounds
            view.bringSubviewToFront(pageControl!)
        }
    }
    
    
}
