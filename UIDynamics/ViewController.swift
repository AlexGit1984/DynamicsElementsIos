//
//  ViewController.swift
//  UIDynamics
//
//  Created by Alex on 4/2/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var squareView = UIView()
    var squareAnchorView = UIView()
    var anchorView = UIView()
    var animator = UIDynamicAnimator()
    var attachmentBehaviour: UIAttachmentBehavior?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createRecognizer()
        createSmallSquareView()
        createAnchorView()
        createAnimatorAndBehaviour()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    func createSmallSquareView(){
            squareView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
            squareView.backgroundColor = UIColor.green
            squareView.center = view.center
            anchorView = UIView(frame: CGRect(x: 60, y: 0, width: 20, height: 20))
            anchorView.backgroundColor = UIColor.brown
            squareView.addSubview(anchorView)
            view.addSubview(squareView)
    }
    
    func createAnchorView()  {
        anchorView = UIView(frame: CGRect(x: 320, y: 320, width: 20, height: 20))
        anchorView.backgroundColor = UIColor.red
        view.addSubview(anchorView)
    }
    
    func createRecognizer()  {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handler(paramPan:)))
        view.addGestureRecognizer(panGestureRecognizer)
    
    }
    
    @objc func handler(paramPan: UIPanGestureRecognizer){
        let tapPoint = paramPan.location(in: view)
        print(tapPoint)
        attachmentBehaviour?.anchorPoint = tapPoint
        anchorView.center = tapPoint
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func createAnimatorAndBehaviour()  {
        animator = UIDynamicAnimator(referenceView: view)
        let collision = UICollisionBehavior(items: [squareView, anchorView])
        collision.translatesReferenceBoundsIntoBoundary = false
        attachmentBehaviour = UIAttachmentBehavior(item: squareView, attachedToAnchor: anchorView.center)
        animator.addBehavior(attachmentBehaviour!)
    }

}

