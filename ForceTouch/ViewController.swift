//
//  ViewController.swift
//  ForceTouch
//
//  Created by Philip Ekman on 02/03/16.
//  Copyright © 2016 Philip Ekman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerPreviewingDelegate {

    @IBOutlet weak var peekButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let shortcut = UIApplicationShortcutItem(type: "se.philipekman.ForceTouch.shortcut", localizedTitle: "💋 Pop", localizedSubtitle: "Show me PopView", icon: UIApplicationShortcutIcon(type: .Love), userInfo: nil)
        UIApplication.sharedApplication().shortcutItems = [shortcut]
        
    }
    
    override func viewDidAppear(animated: Bool) {
        //Check if the user is using a 3d touch phone
        if (traitCollection.forceTouchCapability == .Available) {
            registerForPreviewingWithDelegate(self, sourceView: peekButton)
        }
    }
    
    
    // MARK: UIViewControllerPreviewingDelegate methods
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        guard let vc = storyboard?.instantiateViewControllerWithIdentifier("PopViewController") as? PopViewController else { return nil }
        
        vc.preferredContentSize = CGSize(width: 0, height: 0)
        
        return vc
    }
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        
        showViewController(viewControllerToCommit, sender: self)
        
    }

}

