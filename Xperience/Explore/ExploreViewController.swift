//
//  ExploreViewController.swift
//  Xperience
//
//  Created by 孟琦 on 6/8/17.
//  Copyright © 2017 Xperience. All rights reserved.
//

import UIKit

var searchFONT = UIFont(name: "HelveticaNeue-Light", size: 15)

class ExploreViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var mainBodyView: UIView!
    
    // search view
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchResultLabel: UIButton!
    @IBOutlet weak var searchIconImageView: UIImageView!
    
    // three search criteria
    var searchCityButton = UIButton()
    var searchStartDateButton = UIButton()
    var searchEndDateButton = UIButton()
    var unfoldButton = UIButton()
    var searchDateImageView = UIImageView()
    var searchResult = "  搜索地点 | 时间"
    var searchCity = "  搜索城市"
    var searchStartDate = "  起始日期"
    var searchEndDate = "  离开日期"
    
    // collection view
    @IBOutlet weak var experienceCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // check if the user is logged in.
        var isLoggedIn = true
        if (!isLoggedIn) {
            DispatchQueue.main.async() {
                [unowned self] in
                self.performSegue(withIdentifier: "showSignIn", sender: self)
            }
        }
        
        // format search bar
        formatInitialSearchBar()
        
        // format collection view
        experienceCollectionView.dataSource = self
        experienceCollectionView.delegate = self
        var y = searchView.bounds.origin.y+searchView.bounds.height
        experienceCollectionView.frame = CGRect(x: 0, y: y, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-y-50)
        let flow = experienceCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flow.sectionInset = UIEdgeInsetsMake(20, 0, 20, 0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // format search bar
    func formatInitialSearchBar() {
        searchView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 80)
        searchIconImageView.frame = CGRect(x: 20, y: 30, width: 30, height: 30)
        searchResultLabel.frame = CGRect(x: 70, y: 25, width: UIScreen.main.bounds.width-80, height: 40)
        searchIconImageView.image = #imageLiteral(resourceName: "search")
        searchIconImageView.contentMode = .scaleAspectFit
        searchResultLabel.setTitle(searchResult, for: .normal)
        searchResultLabel.setTitleColor(UIColor.white, for: .normal)
        searchResultLabel.backgroundColor = UIColor.init(white: 1, alpha: 0.5)
        
    }
    
    func formatAfterTappedSearchBar() {
        
        UIView.animate(withDuration: 0.3, animations: {
            // make search view longer and move collectionview downwards
            self.searchView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 210)
            
            var y = self.searchView.bounds.origin.y+self.searchView.bounds.height
            self.experienceCollectionView.frame = CGRect(x: 0, y: y, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-y-50)
            
          })
        
        searchResultLabel.isHidden = true
        searchIconImageView.image = #imageLiteral(resourceName: "searchCity")
            
        self.searchView.addSubview(self.searchCityButton)
        self.searchView.addSubview(self.searchStartDateButton)
        self.searchView.addSubview(self.searchEndDateButton)
        self.searchView.addSubview(self.unfoldButton)
        self.searchView.addSubview(self.searchDateImageView)
        
        self.searchCityButton.isHidden = false
        self.searchStartDateButton.isHidden = false
        self.searchEndDateButton.isHidden = false
        self.unfoldButton.isHidden = false
        self.searchDateImageView.isHidden = false
    
        self.searchCityButton.frame = CGRect(x: 70, y: 25, width: UIScreen.main.bounds.width-80, height: 40)
        self.searchCityButton.setTitle(self.searchCity, for: .normal)
        self.searchCityButton.setTitleColor(UIColor.white, for: .normal)
        self.searchCityButton.backgroundColor = UIColor.init(white: 1, alpha: 0.5)
        self.searchCityButton.contentHorizontalAlignment = .left
        self.searchCityButton.titleLabel?.font = searchFONT
        
        self.searchStartDateButton.frame = CGRect(x: 70, y: 75, width: UIScreen.main.bounds.width-80, height: 40)
        self.searchStartDateButton.setTitle(self.searchStartDate, for: .normal)
        self.searchStartDateButton.setTitleColor(UIColor.white, for: .normal)
        self.searchStartDateButton.backgroundColor = UIColor.init(white: 1, alpha: 0.5)
        self.searchStartDateButton.contentHorizontalAlignment = .left
        self.searchStartDateButton.titleLabel?.font = searchFONT
        
        self.searchEndDateButton.frame = CGRect(x: 70, y: 125, width: UIScreen.main.bounds.width-80, height: 40)
        self.searchEndDateButton.setTitle(self.searchEndDate, for: .normal)
        self.searchEndDateButton.setTitleColor(UIColor.white, for: .normal)
        self.searchEndDateButton.backgroundColor = UIColor.init(white: 1, alpha: 0.5)
        self.searchEndDateButton.contentHorizontalAlignment = .left
        self.searchEndDateButton.titleLabel?.font = searchFONT
        
        self.searchDateImageView.frame = CGRect(x: 20, y: 100, width: 30, height: 30)
        self.searchDateImageView.image = #imageLiteral(resourceName: "searchDate")
        
        unfoldButton.frame = CGRect(x: UIScreen.main.bounds.width/2, y: 185, width: 40, height: 15)
        unfoldButton.setImage(#imageLiteral(resourceName: "unfold"), for: .normal)
        unfoldButton.addTarget(self, action: #selector(unfoldButtonPressed), for: .touchUpInside)
        
        
    }
    
    func unfoldButtonPressed(_ sender: UIButton!) {
        if (sender == unfoldButton) {
            UIView.animate(withDuration: 0.3, animations: {
                self.searchView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 80)
                let y = self.searchView.bounds.origin.y+self.searchView.bounds.height
                self.experienceCollectionView.frame = CGRect(x: 0, y: y, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-y-50)
                
                self.searchResultLabel.isHidden = false
                self.searchIconImageView.image = #imageLiteral(resourceName: "search")
                self.searchCityButton.isHidden = true
                self.searchStartDateButton.isHidden = true
                self.searchEndDateButton.isHidden = true
                self.unfoldButton.isHidden = true
                self.searchDateImageView.isHidden = true
            })
        }
    }
    
    @IBAction func searchLabelButtonTapped(_ sender: Any) {
        formatAfterTappedSearchBar()
    
    }
    
    
    // format collection view
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        var height = (UIScreen.main.bounds.width/2-40)/9*16+50
        return CGSize(width: UIScreen.main.bounds.width/2, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = experienceCollectionView.dequeueReusableCell(withReuseIdentifier: "exploreCell", for: indexPath) as! ExploreExperienceCollectionViewCell
        
        // format elements
        let height = (UIScreen.main.bounds.width/2-40)/9*16
        cell.expImage.frame = CGRect(x: 20, y: 0, width: (UIScreen.main.bounds.width/2-40), height: height)
        cell.expTitle.frame = CGRect(x: 20, y: height, width: (UIScreen.main.bounds.width/2-40), height: 20)
        cell.expPrice.frame = CGRect(x: 20, y: height+20, width: (UIScreen.main.bounds.width/2-40), height: 20)
        cell.expRating.frame = CGRect(x: 20, y: height+40, width: (UIScreen.main.bounds.width/2-40), height: 10)
        
        // format contents
        cell.expImage.contentMode = .scaleAspectFill
        cell.expImage.clipsToBounds = true
        cell.expImage.image = #imageLiteral(resourceName: "test")
        cell.expTitle.font = UIFont(name: "HelveticaNeue-Light", size: 15)
        cell.expPrice.font = UIFont(name: "HelveticaNeue-Light", size: 15)
        cell.expRating.font = UIFont(name: "HelveticaNeue-Light", size: 10)
        return cell
    }

    
}
