//
//  AboutAppViewController.swift
//  orderApp(ver2)
//
//  Created by Роза Шархмуллина on 09.05.23.
//

import UIKit

class AboutAppViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var buttonLabel: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides: [OnboardingSlide] = []
    var currentPage = 0 {
        didSet {
            if currentPage == slides.count - 1 {
                buttonLabel.setTitle("Get Started", for: .normal)
            } else {
                buttonLabel.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        slides = [OnboardingSlide(title: "Delicious Dishes", description: "Choose from sushi, over 60 different wines, sake, seasonal offerings", image: UIImage(named: "sushi")!), OnboardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared by only the best", image: UIImage(named: "shef")!), OnboardingSlide(title: "Delivery & Reservation", description: "Your orders will be delivered instantly irrespactive of your location.", image: UIImage(named: "delivery")!)]

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButtonAction(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                sceneDelegate.checkAuthentication()
            }
        } else {
            currentPage += 1
            
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AboutAppViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AboutAppCollectionViewCell", for: indexPath) as! AboutAppCollectionViewCell
        cell.setUp(slides[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
    }
}
