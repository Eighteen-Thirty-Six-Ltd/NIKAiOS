//
//  NikaOnBoardingPageCtrlr.swift
//  Nika
//
//  Created by Basavaraj  on 06/09/19.
//  Copyright © 2019 1836. All rights reserved.
//

import UIKit

class NikaOnBoardingPageCtrlr: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource, NikaOnBoardingContentControllerDelegate {

    var pageControl = UIPageControl()
    
    // MARK: UIPageViewControllerDataSource
    
    var orderedViewControllers = [UIViewController]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        
        self.orderedViewControllers = [self.newVc(viewControllerIdentifier: "Page1"),
                                       self.newVc(viewControllerIdentifier: "Page2"),
                                       self.newVc(viewControllerIdentifier: "Page3")]
        
        // This sets up the first view that will show up on our page control
        if let firstViewController = self.orderedViewControllers.first {
            self.setViewControllers([firstViewController],
                                    direction: .forward,
                                    animated: true,
                                    completion: nil)
        }
        
//        configurePageControl()
    }
    
    func configurePageControl()
    {
        // The total number of pages that are available is based on how many available colors we have.
        pageControl = UIPageControl(frame: CGRect(x: ((UIScreen.main.bounds.width / 2) - 50),y: UIScreen.main.bounds.maxY - 70,width: 100,height: 50))
        self.pageControl.numberOfPages = orderedViewControllers.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.lightGray
        self.pageControl.currentPageIndicatorTintColor = UIColor.white
        self.view.addSubview(pageControl)
    }
    
    func newVc(viewControllerIdentifier: String) -> UIViewController
    {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: viewControllerIdentifier) as! NikaOnBoardingContentController
        viewController.pageContentDelegate = self
        return viewController
    }
    
    // MARK: Delegate methords
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool)
    {
        let pageContentViewController = pageViewController.viewControllers![0] as! NikaOnBoardingContentController
        pageContentViewController.updateForPage(pageNumber: orderedViewControllers.index(of: pageContentViewController)!)
//        self.pageControl.currentPage = orderedViewControllers.index(of: pageContentViewController)!
    }
    
    // MARK: Data source functions.
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        // User is on the first view controller and swiped left to loop to
        // the last view controller.
        guard previousIndex >= 0 else {
            return orderedViewControllers.last
            // Uncommment the line below, remove the line above if you don't want the page control to loop.
            // return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        // User is on the last view controller and swiped right to loop to
        // the first view controller.
        guard orderedViewControllersCount != nextIndex else {
            return orderedViewControllers.first
            // Uncommment the line below, remove the line above if you don't want the page control to loop.
            // return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
    // MARK : BBInitialPageContentControllerDelegate methods
    
    func firstPageGetStartedTapped()
    {
        self.tranisitionToSignIn()
    }
    
    func secondPageGetStartedTapped()
    {
        self.tranisitionToSignIn()
    }
    
    func thirdPageGetStartedTapped()
    {
        self.tranisitionToSignIn()
    }
    
    func tranisitionToSignIn()
    {
        let baseNav = self.storyboard?.instantiateViewController(withIdentifier: "NikeSignUpController")
        self.present(baseNav!, animated: true, completion: nil)
    }

}
