//
//  FullStory.swift
//  Stories
//
//  Created by Alexey on 21.03.2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import UIKit
class FullStory{
    
    let storyView: UIView = {
        let view_ = UIView()
        view_.translatesAutoresizingMaskIntoConstraints = false
        view_.backgroundColor = .some(UIColor(displayP3Red: 90/255, green: 0, blue: 157/255, alpha: 0.8))
        view_.layer.cornerRadius = 20
        return view_
        
    }()
    
    func getFullStoryView() -> UIView {
        
        return storyView
    }
}
