//
//  HomeContentCell.swift
//  RestartTechnologyTask
//
//  Created by Ahmed Samir on 9/23/20.
//  Copyright © 2020 Ahmed Samir. All rights reserved.
//

import UIKit

enum HomeContentType{
    case hotspots
    case events
    case attractions
}

class HomeContentCell: UITableViewCell {

    @IBOutlet weak var viewAllBtn: UIButton!
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var subContentCollectionView: UICollectionView!
    
    let cellIdentifier = "SubHomeContentCell"
    var homeContent: HomeContentDTO?
    var homeContentType: HomeContentType = .hotspots
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.subContentCollectionView.register(UINib(nibName: self.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: self.cellIdentifier)
        self.subContentCollectionView.dataSource = self
        self.subContentCollectionView.delegate = self
    }
    
    func cellConfig(){
        
        if self.homeContentType == .hotspots{
            self.headerImage.image = #imageLiteral(resourceName: "hotspot_icon")
            self.headerLbl.text = "Hotspots"
        }else if self.homeContentType == .events{
            self.headerImage.image = #imageLiteral(resourceName: "events_icon")
            self.headerLbl.text = "Events"
        }else{
            self.headerImage.image = #imageLiteral(resourceName: "attarctions_icon")
            self.headerLbl.text = "Attractions"
        }
        self.subContentCollectionView.reloadData()
    }
}

extension HomeContentCell: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if self.homeContentType == .hotspots{
            return self.homeContent?.data?.hot_spots?.count ?? 0
        }else if self.homeContentType == .events{
            return self.homeContent?.data?.events?.count ?? 0
        }else{
            return self.homeContent?.data?.attractions?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as? SubHomeContentCell else {return UICollectionViewCell()}
        
        if self.homeContentType == .hotspots{
            if let images = self.homeContent?.data?.hot_spots?[indexPath.row].photos{
                cell.image.setImage(from: images.first, "placeholder", .fade(0.2))
            }
            cell.titleLbl.text = self.homeContent?.data?.hot_spots?[indexPath.row].name
            cell.typeLbl.text = self.homeContent?.data?.hot_spots?[indexPath.row].short_description
        }
        
        if self.homeContentType == .events{
            if let images = self.homeContent?.data?.events?[indexPath.row].photos{
                cell.image.setImage(from: images.first, "placeholder", .fade(0.2))
            }
            cell.titleLbl.text = self.homeContent?.data?.events?[indexPath.row].name
            cell.typeLbl.text = self.homeContent?.data?.events?[indexPath.row].short_description
        }
        
        if self.homeContentType == .attractions{
            if let images = self.homeContent?.data?.attractions?[indexPath.row].photos{
                cell.image.setImage(from: images.first, "placeholder", .fade(0.2))
            }
            cell.titleLbl.text = self.homeContent?.data?.attractions?[indexPath.row].name
            cell.typeLbl.text = self.homeContent?.data?.attractions?[indexPath.row].description
        }
        
        return cell
    }
}

extension HomeContentCell: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 300)
    }
}
