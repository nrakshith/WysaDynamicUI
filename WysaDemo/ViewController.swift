//
//  ViewController.swift
//  WysaDemo
//
//  Created by Rakshith N on 04/04/21.
//

import UIKit

class ViewController: UIViewController {
    
    private var animator : UIDynamicAnimator!
    private var snapping : UISnapBehavior!
    
    private let cardView: UIView = {
        let view = UIView(frame: CGRect(x: 10, y: 10, width: 100, height: 100))
        view.backgroundColor = .cyan
        return view
    }()
    
    static func constructModule() -> ViewController {
        let viewController = ViewController()
        return viewController
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildView()
    }

    private func buildView() {
        view.backgroundColor = .white
        
        view.addConstraintSubViews(cardView)
            
        animator = UIDynamicAnimator(referenceView: view)
        snapping = UISnapBehavior(item: cardView, snapTo: view.center)
        animator.addBehavior(snapping)
        
        addGuestur()
        
    }
    
    private func addGuestur(){
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(cardViewGesture))
        cardView.addGestureRecognizer(gesture)
        cardView.isUserInteractionEnabled = true
    }
    
    @objc func cardViewGesture(recognizer : UIPanGestureRecognizer){
        switch recognizer.state {
        case .began:
            animator.removeBehavior(snapping)
        case .changed:
            let translation = recognizer.translation(in: view)
            cardView.center = CGPoint(x: cardView.center.x + translation.x, y: cardView.center.y + translation.y)
            recognizer.setTranslation(.zero, in: view)
        case .ended, .failed, .cancelled:
            animator.addBehavior(snapping)
        default:
            break
        }
    }

}
