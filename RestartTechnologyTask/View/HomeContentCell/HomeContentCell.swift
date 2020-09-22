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

    var homeContent: HomeContentDTO?
    var homeContentType: HomeContentType?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
