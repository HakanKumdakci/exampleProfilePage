//
//  CustomCell.swift
//  testApp
//
//  Created by Akakce on 17.08.2021.
//

import UIKit

class CustomCell: UITableViewCell {

    
    
    var image1: UIImageView = {
        var img = UIImageView(frame: .zero)
        img.backgroundColor = .white
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 18
        return img
    }()
    
    var image2: UIImageView = {
        var img = UIImageView(frame: .zero)
        img.backgroundColor = .white
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 18
        return img
    }()
    
    var image3: UIImageView = {
        var img = UIImageView(frame: .zero)
        img.backgroundColor = .white
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 18
        return img
    }()
    
    var image4: UIImageView = {
        var img = UIImageView(frame: .zero)
        img.backgroundColor = .white
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 18
        return img
    }()
    
    var image5: UIImageView = {
        var img = UIImageView(frame: .zero)
        img.backgroundColor = .white
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 18
        return img
    }()
    
    var image6: UIImageView = {
        var img = UIImageView(frame: .zero)
        img.backgroundColor = .white
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 18
        return img
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        let widthOfSmallBoxes = frame.width/3
        let heightOfSmallBoxes = CGFloat(300/3)
              
        addSubview(image1)
        image1.anchor(top: readableContentGuide.topAnchor, leading: nil, bottom: nil, trailing: readableContentGuide.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: CGSize(width: widthOfSmallBoxes, height: heightOfSmallBoxes))
        
        
        addSubview(image2)
        image2.anchor(top: image1.bottomAnchor, leading: nil, bottom: nil, trailing: readableContentGuide.trailingAnchor, padding: .init(top: 10, left: 5, bottom: 0, right: 0), size: CGSize(width: widthOfSmallBoxes, height: heightOfSmallBoxes))
        
        addSubview(image3)
        image3.anchor(top: readableContentGuide.topAnchor, leading: readableContentGuide.leadingAnchor, bottom: nil, trailing: image1.leadingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: -20), size: CGSize(width: 0, height: heightOfSmallBoxes*2))
        
        
        addSubview(image4)
        image4.anchor(top: image2.bottomAnchor, leading: nil, bottom: nil, trailing: readableContentGuide.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0), size: CGSize(width: widthOfSmallBoxes, height: heightOfSmallBoxes))
        
        addSubview(image5)
        image5.anchor(top: image3.bottomAnchor, leading: nil, bottom: nil, trailing: image4.leadingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: -20), size: CGSize(width: widthOfSmallBoxes, height: heightOfSmallBoxes))
        
        
        addSubview(image6)
        image6.anchor(top: image3.bottomAnchor, leading: readableContentGuide.leadingAnchor, bottom: nil, trailing: image5.leadingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: -20), size: CGSize(width: 0, height: heightOfSmallBoxes))
        
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
