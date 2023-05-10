//
//  AboutAppCollectionViewCell.swift
//  orderApp(ver2)
//
//  Created by Роза Шархмуллина on 09.05.23.
//

import UIKit

class AboutAppCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    @IBOutlet weak var slideImageView: UIImageView!
    
    func setUp(_ slide: OnboardingSlide) {
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
    }
}
