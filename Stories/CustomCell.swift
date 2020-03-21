//
//  CustomCell.swift
//  Stories
//
//  Created by Alexey on 21.03.2020.
//  Copyright © 2020 Alexey. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell{
    struct data{
        let image = #imageLiteral(resourceName: "testPic")
        let textOfStory = ""
    }
    fileprivate let stroyView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = #imageLiteral(resourceName: "testPic")
        imgView.layer.cornerRadius = 10
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(stroyView)
        stroyView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stroyView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        stroyView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stroyView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
