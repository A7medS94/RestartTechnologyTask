//
//  HomeViewModel.swift
//  RestartTechnologyTask
//
//  Created by Ahmed Samir on 9/22/20.
//  Copyright © 2020 Ahmed Samir. All rights reserved.
//

import Foundation
import RxSwift

class HomeViewModel: BaseViewModel{
    
    var homeContentObservable: Observable<HomeContentDTO>?
    
    func homeContentRequest()-> Observable<HomeContentDTO>?{
        self.homeContentObservable = self.provider.rx.request(.getHomeContent)
            .debug()
            .map(HomeContentDTO.self)
            .asObservable()
        return self.homeContentObservable
    }
}
