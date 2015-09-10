//
//  ViewController.swift
//  PagingMenuControllerDemo
//
//  Created by Yusuke Kita on 5/10/15.
//  Copyright (c) 2015 kitasuke. All rights reserved.
//

import UIKit
import PagingMenuController

class ViewController: UIViewController, PagingMenuControllerDelegate {

    var pagingMenuController: PagingMenuController!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let usersViewController = self.storyboard?.instantiateViewControllerWithIdentifier("UsersViewController") as! UsersViewController
        let repositoriesViewController = self.storyboard?.instantiateViewControllerWithIdentifier("RepositoriesViewController") as! RepositoriesViewController
        let gistsViewController = self.storyboard?.instantiateViewControllerWithIdentifier("GistsViewController") as! GistsViewController
        let organizationsViewController = self.storyboard?.instantiateViewControllerWithIdentifier("OrganizationsViewController") as! OrganizationsViewController
        
        let viewControllers = [usersViewController, repositoriesViewController, gistsViewController, organizationsViewController]
        
        let options = PagingMenuOptions()
        options.menuHeight = 50
        options.pagedColors = [UIColor.redColor(), UIColor.whiteColor(), UIColor.greenColor()]
        options.backgroundColor = UIColor.clearColor()
        options.itemBackgroundColor = UIColor.clearColor()
        options.itemSelectedBackgroundColor = UIColor(white: 1, alpha: 0.8)
        options.borderWidth = 1
        options.borderColor = UIColor.whiteColor()
        options.menuDisplayMode = PagingMenuOptions.MenuDisplayMode.FlexibleItemWidth(centerItem: false, scrollingMode: PagingMenuOptions.MenuScrollingMode.ScrollEnabled)
        options.menuItemMode = PagingMenuOptions.MenuItemMode.RoundRect(radius: 10, horizontalScale: 0.5, verticalScale: 0.5)
        
        pagingMenuController = self.childViewControllers.first as! PagingMenuController
        pagingMenuController.delegate = self
        pagingMenuController.setup(viewControllers: viewControllers, options: options)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(1, animations: {
            self.pagingMenuController.changeBackgroundColor(UIColor.blackColor(), animated: false)
        })
    }
    // MARK: - PagingMenuControllerDelegate
    
    func willMoveToMenuPage(page: Int) {
    }
    
    func didMoveToMenuPage(page: Int) {
    }
    
    func tappedButtonAtIndex(index: Int) {
        
    }
}

