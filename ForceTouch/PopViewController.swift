//
//  PopViewController.swift
//  ForceTouch
//
//  Created by Philip Ekman on 02/03/16.
//  Copyright © 2016 Philip Ekman. All rights reserved.
//

import UIKit

class PopViewController: UIViewController {
    
    var circle:UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
override func previewActionItems() -> [UIPreviewActionItem] {
        
    let likeAction = UIPreviewAction(title: "Like", style: .Default) { (action: UIPreviewAction, vc: UIViewController) -> Void in
            print("Like item pressed")
    }
        
    let deleteAction = UIPreviewAction(title: "Delete", style: .Destructive) { (action: UIPreviewAction, vc: UIViewController) -> Void in
            print("Delete item pressed")
    }
        
    return [likeAction, deleteAction]
}
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let width:CGFloat = 50.0
        let height:CGFloat = 50.0
        
        if let touch = touches.first where traitCollection.forceTouchCapability == .Available {
            
            if (circle == nil) {
                
                circle = UIImageView(frame: CGRect(x: touch.locationInView(self.view).x - width/2, y: touch.locationInView(self.view).y - height/2, width: width, height: height))
                circle!.image = UIImage(named: "circle")
                self.view.addSubview(circle!)
                
            } else {
                UIView.animateWithDuration(0.0, animations: { () -> Void in
                    self.circle!.transform = CGAffineTransformMakeScale(touch.force, touch.force)
                })
            }
            
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if circle != nil {
            circle!.removeFromSuperview()
            circle = nil
        }
        
    }
    

}
