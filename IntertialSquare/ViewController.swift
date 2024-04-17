//
//  ViewController.swift
//  IntertialSquare
//
//  Created by Бучевский Андрей on 17.04.2024.
//

import UIKit


class ViewController: UIViewController {

    lazy var cardView: UIView = {
        let view = UIView()
        view.frame.size = CGSize(width: 100, height: 100)
        view.center = self.view.center
        view.backgroundColor = .blue
        view.layer.cornerRadius = 20
        return view
    }()

    lazy var animator = UIDynamicAnimator(referenceView: view)
    var snapping: UISnapBehavior!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(cardView)

        let recognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(recognizer)
    }

    @objc
    func handleTap(sender: UITapGestureRecognizer) {
        let tapPoint = sender.location(in: view)

        if snapping != nil {
            animator.removeBehavior(snapping)
        }

        snapping = UISnapBehavior(item: cardView, snapTo: tapPoint)
        animator.addBehavior(snapping)
    }
}
