//
//  ViewController.swift
//  Stories
//
//  Created by Alexey on 21.03.2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    var viewStory = UIView()
    var counter = 0
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5,height: collectionView.frame.width/2)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        checkerAllreadyOpenStory()
        
        viewStory = FullStory().getFullStoryView()
        sleep(UInt32(0.25))
        UIView.transition(with: self.view, duration: 0.25, options: [.transitionCrossDissolve], animations: {
            self.view.addSubview(self.viewStory)
        }, completion: nil)
        
        self.viewStory.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        self.viewStory.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        self.viewStory.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        self.viewStory.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CustomCell
        
        //cell.backgroundView?.layer.cornerRadius = 20
        return cell
    }
    

    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "myCell")
        return cv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        upSwipe.direction = .up
        view.addGestureRecognizer(upSwipe)
        
        
        collectionView.showsHorizontalScrollIndicator = false
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 0.5).isActive = true
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

    func checkerAllreadyOpenStory(){
        
    }
    @objc func handleSwipe(sender: UISwipeGestureRecognizer){
        UIView.transition(with: self.view, duration: 20, options: [.transitionCurlUp], animations: {
            self.viewStory.removeFromSuperview()
        }, completion: nil)
        print("I CATCH A SWIPE UP")
    }
}

