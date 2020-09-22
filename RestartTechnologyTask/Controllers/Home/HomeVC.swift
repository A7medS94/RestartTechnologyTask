//
//  HomeVC.swift
//  RestartTechnologyTask
//
//  Created by Ahmed Samir on 9/22/20.
//  Copyright © 2020 Ahmed Samir. All rights reserved.
//

import UIKit
import RxSwift
import SnapKit

class HomeVC: BaseVC {
    
    //MARK: - Outlets
    @IBOutlet weak var homeContentTableView: UITableView!
    @IBOutlet weak var viewModel: HomeViewModel!
    
    //MARK: - Vars
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.isHidden = true
        view.alpha = 0.0
        return view
    }()
    
    //Bellman
    lazy var bellmanShadowView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var bellmanContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    lazy var bellmanBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "bellman_bottom-icon"), for: .normal)
        btn.addTarget(self, action: #selector(bellmanBtnBtnDidTapped), for: .touchUpInside)
        return btn
    }()
    
    //Hotspots
    lazy var hotspotsBaseView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.isHidden = true
        view.alpha = 0.0
        return view
    }()
    
    lazy var hotspotsShadowView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var hotspotsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    lazy var hotspotsBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "hotspot_icon"), for: .normal)
        btn.backgroundColor = .white
        btn.addTarget(self, action: #selector(hotspotsBtnDidTapped), for: .touchUpInside)
        return btn
    }()
    
    lazy var hotspotsLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Hotspots"
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        lbl.textColor = .darkGray
        return lbl
    }()
    
    //Events
    lazy var eventsBaseView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.isHidden = true
        view.alpha = 0.0
        return view
    }()
    
    lazy var eventsShadowView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var eventsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    lazy var eventsBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "events_icon"), for: .normal)
        btn.backgroundColor = .white
        btn.addTarget(self, action: #selector(eventsBtnDidTapped), for: .touchUpInside)
        return btn
    }()
    
    lazy var eventsLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Events"
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        lbl.textColor = .darkGray
        return lbl
    }()
    
    //Attractions
    lazy var attractionsBaseView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.isHidden = true
        view.alpha = 0.0
        return view
    }()
    
    lazy var attractionsShadowView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var attractionsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    lazy var attractionsBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "attarctions_icon"), for: .normal)
        btn.backgroundColor = .white
        btn.addTarget(self, action: #selector(attractionsBtnDidTapped), for: .touchUpInside)
        return btn
    }()
    
    lazy var attractionsLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Attractions"
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        lbl.textColor = .darkGray
        return lbl
    }()
    
    //Map
    lazy var mapBaseView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.isHidden = true
        view.alpha = 0.0
        return view
    }()
    
    lazy var mapShadowView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var mapContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    lazy var mapBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "small_grey_location_pin"), for: .normal)
        btn.backgroundColor = .white
        btn.addTarget(self, action: #selector(mapBtnDidTapped), for: .touchUpInside)
        return btn
    }()
    
    lazy var mapLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Map"
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        lbl.textColor = .darkGray
        return lbl
    }()
    
    let cellIndentifier = "HomeContentCell"
    var startAnimating: Bool = false
    let containerViewAlpha: CGFloat = 0.2
    let disposeBag = DisposeBag()
    var homeContent: HomeContentDTO?
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Methods
    override func setupViews() {
        
        view.addSubview(containerView)
        self.containerView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top)
            make.bottom.equalTo(self.view.snp.bottom)
            make.leading.equalTo(self.view.snp.leading)
            make.trailing.equalTo(self.view.snp.trailing)
        }
        
        view.addSubview(bellmanShadowView)
        self.bellmanShadowView.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.bottom.equalTo(view.snp.bottom).offset(-50)
            make.height.equalTo(62)
            make.width.equalTo(62)
        }
        self.bellmanShadowView.dropShadow(color: .black, opacity: 0.2, offSet: CGSize.zero, radius: 5, scale: true)
        self.bellmanShadowView.addSubview(bellmanContainerView)
        self.bellmanContainerView.snp.makeConstraints { (make) in
            make.top.equalTo(self.bellmanShadowView.snp.top)
            make.bottom.equalTo(self.bellmanShadowView.snp.bottom)
            make.leading.equalTo(self.bellmanShadowView.snp.leading)
            make.trailing.equalTo(self.bellmanShadowView.snp.trailing)
        }
        self.bellmanContainerView.circleView(width: 62)
        self.bellmanContainerView.addSubview(self.bellmanBtn)
        self.bellmanBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.bellmanContainerView.snp.top)
            make.bottom.equalTo(self.bellmanContainerView.snp.bottom)
            make.leading.equalTo(self.bellmanContainerView.snp.leading)
            make.trailing.equalTo(self.bellmanContainerView.snp.trailing)
        }
        
        view.addSubview(self.hotspotsBaseView)
        self.hotspotsBaseView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.bellmanShadowView.snp.centerY).multipliedBy(1.019)
            make.trailing.equalTo(self.bellmanShadowView.snp.leading).offset(-45)
            make.width.equalTo(65)
        }
        self.hotspotsBaseView.addSubview(self.hotspotsShadowView)
        self.hotspotsShadowView.snp.makeConstraints { (make) in
            make.top.equalTo(self.hotspotsBaseView.snp.top)
            make.centerX.equalTo(self.hotspotsBaseView.snp.centerX)
        }
        self.hotspotsShadowView.dropShadow(color: .black, opacity: 0.2, offSet: CGSize.zero, radius: 5, scale: true)
        self.hotspotsShadowView.addSubview(self.hotspotsContainerView)
        self.hotspotsContainerView.snp.makeConstraints { (make) in
            make.top.equalTo(self.hotspotsShadowView.snp.top)
            make.bottom.equalTo(self.hotspotsShadowView.snp.bottom)
            make.leading.equalTo(self.hotspotsShadowView.snp.leading)
            make.trailing.equalTo(self.hotspotsShadowView.snp.trailing)
            make.width.equalTo(55)
            make.height.equalTo(55)
        }
        self.hotspotsContainerView.circleView(width: 55)
        self.hotspotsContainerView.addSubview(self.hotspotsBtn)
        self.hotspotsBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.hotspotsContainerView.snp.top)
            make.bottom.equalTo(self.hotspotsContainerView.snp.bottom)
            make.leading.equalTo(self.hotspotsContainerView.snp.leading)
            make.trailing.equalTo(self.hotspotsContainerView.snp.trailing)
        }
        self.hotspotsBaseView.addSubview(self.hotspotsLbl)
        self.hotspotsLbl.snp.makeConstraints { (make) in
            make.top.equalTo(self.hotspotsShadowView.snp.bottom).offset(5)
            make.centerX.equalTo(self.hotspotsShadowView.snp.centerX)
            make.bottom.equalTo(self.hotspotsBaseView.snp.bottom).offset(-5)
        }
        
        view.addSubview(self.eventsBaseView)
        self.eventsBaseView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view).multipliedBy(0.75)
            make.bottom.equalTo(self.bellmanShadowView.snp.top).offset(-7)
            make.width.equalTo(65)
        }
        self.eventsBaseView.addSubview(self.eventsShadowView)
        self.eventsShadowView.snp.makeConstraints { (make) in
            make.top.equalTo(self.eventsBaseView.snp.top)
            make.centerX.equalTo(self.eventsBaseView.snp.centerX)
        }
        self.eventsShadowView.dropShadow(color: .black, opacity: 0.2, offSet: CGSize.zero, radius: 5, scale: true)
        self.eventsShadowView.addSubview(self.eventsContainerView)
        self.eventsContainerView.snp.makeConstraints { (make) in
            make.top.equalTo(self.eventsShadowView.snp.top)
            make.bottom.equalTo(self.eventsShadowView.snp.bottom)
            make.leading.equalTo(self.eventsShadowView.snp.leading)
            make.trailing.equalTo(self.eventsShadowView.snp.trailing)
            make.width.equalTo(55)
            make.height.equalTo(55)
        }
        self.eventsContainerView.circleView(width: 55)
        self.eventsContainerView.addSubview(self.eventsBtn)
        self.eventsBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.eventsContainerView.snp.top)
            make.bottom.equalTo(self.eventsContainerView.snp.bottom)
            make.leading.equalTo(self.eventsContainerView.snp.leading)
            make.trailing.equalTo(self.eventsContainerView.snp.trailing)
        }
        self.eventsBaseView.addSubview(self.eventsLbl)
        self.eventsLbl.snp.makeConstraints { (make) in
            make.top.equalTo(self.eventsShadowView.snp.bottom).offset(5)
            make.centerX.equalTo(self.eventsShadowView.snp.centerX)
            make.bottom.equalTo(self.eventsBaseView.snp.bottom).offset(-5)
        }
        
        view.addSubview(self.attractionsBaseView)
        self.attractionsBaseView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view).multipliedBy(1.25)
            make.bottom.equalTo(self.bellmanShadowView.snp.top).offset(-7)
            make.width.equalTo(65)
        }
        self.attractionsBaseView.addSubview(self.attractionsShadowView)
        self.attractionsShadowView.snp.makeConstraints { (make) in
            make.top.equalTo(self.attractionsBaseView.snp.top)
            make.centerX.equalTo(self.attractionsBaseView.snp.centerX)
        }
        self.attractionsShadowView.dropShadow(color: .black, opacity: 0.2, offSet: CGSize.zero, radius: 5, scale: true)
        self.attractionsShadowView.addSubview(self.attractionsContainerView)
        self.attractionsContainerView.snp.makeConstraints { (make) in
            make.top.equalTo(self.attractionsShadowView.snp.top)
            make.bottom.equalTo(self.attractionsShadowView.snp.bottom)
            make.leading.equalTo(self.attractionsShadowView.snp.leading)
            make.trailing.equalTo(self.attractionsShadowView.snp.trailing)
            make.width.equalTo(55)
            make.height.equalTo(55)
        }
        self.attractionsContainerView.circleView(width: 55)
        self.attractionsContainerView.addSubview(self.attractionsBtn)
        self.attractionsBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.attractionsContainerView.snp.top)
            make.bottom.equalTo(self.attractionsContainerView.snp.bottom)
            make.leading.equalTo(self.attractionsContainerView.snp.leading)
            make.trailing.equalTo(self.attractionsContainerView.snp.trailing)
        }
        self.attractionsBaseView.addSubview(self.attractionsLbl)
        self.attractionsLbl.snp.makeConstraints { (make) in
            make.top.equalTo(self.attractionsShadowView.snp.bottom).offset(5)
            make.centerX.equalTo(self.attractionsShadowView.snp.centerX)
            make.bottom.equalTo(self.attractionsBaseView.snp.bottom).offset(-5)
        }
        
        view.addSubview(self.mapBaseView)
        self.mapBaseView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.bellmanShadowView.snp.centerY).multipliedBy(1.019)
            make.leading.equalTo(self.bellmanShadowView.snp.trailing).offset(45)
            make.width.equalTo(65)
        }
        self.mapBaseView.addSubview(self.mapShadowView)
        self.mapShadowView.snp.makeConstraints { (make) in
            make.top.equalTo(self.mapBaseView.snp.top)
            make.centerX.equalTo(self.mapBaseView.snp.centerX)
        }
        self.mapShadowView.dropShadow(color: .black, opacity: 0.2, offSet: CGSize.zero, radius: 5, scale: true)
        self.mapShadowView.addSubview(self.mapContainerView)
        self.mapContainerView.snp.makeConstraints { (make) in
            make.top.equalTo(self.mapShadowView.snp.top)
            make.bottom.equalTo(self.mapShadowView.snp.bottom)
            make.leading.equalTo(self.mapShadowView.snp.leading)
            make.trailing.equalTo(self.mapShadowView.snp.trailing)
            make.width.equalTo(55)
            make.height.equalTo(55)
        }
        self.mapContainerView.circleView(width: 55)
        self.mapContainerView.addSubview(self.mapBtn)
        self.mapBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.mapContainerView.snp.top)
            make.bottom.equalTo(self.mapContainerView.snp.bottom)
            make.leading.equalTo(self.mapContainerView.snp.leading)
            make.trailing.equalTo(self.mapContainerView.snp.trailing)
        }
        self.mapBaseView.addSubview(self.mapLbl)
        self.mapLbl.snp.makeConstraints { (make) in
            make.top.equalTo(self.mapShadowView.snp.bottom).offset(5)
            make.centerX.equalTo(self.mapShadowView.snp.centerX)
            make.bottom.equalTo(self.mapBaseView.snp.bottom).offset(-5)
        }
    }
    
    override func setupOutlets() {
        self.homeContentTableView.register(UINib(nibName: self.cellIndentifier, bundle: nil), forCellReuseIdentifier: self.cellIndentifier)
    }
    
    private func startAnimation(completion: (() -> ())? = nil){
        self.startAnimating = true
        self.containerView.isHidden = false
        UIView.animate(withDuration: 0.1, delay: 0.0, options: [], animations: {
            self.containerView.alpha = self.containerViewAlpha
        }) { (completed) in
            self.hotspotsBaseView.isHidden = false
            UIView.animate(withDuration: 0.1, delay: 0.0, options: [], animations: {
                self.hotspotsBaseView.alpha = 1
                self.hotspotsBaseView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            }) { (completed) in
                self.hotspotsBaseView.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.eventsBaseView.isHidden = false
                UIView.animate(withDuration: 0.1, delay: 0.0, options: [], animations: {
                    self.eventsBaseView.alpha = 1
                    self.eventsBaseView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                }) { (completed) in
                    self.eventsBaseView.transform = CGAffineTransform(scaleX: 1, y: 1)
                    self.attractionsBaseView.isHidden = false
                    UIView.animate(withDuration: 0.1, delay: 0.0, options: [], animations: {
                        self.attractionsBaseView.alpha = 1
                        self.attractionsBaseView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                    }) { (completed) in
                        self.attractionsBaseView.transform = CGAffineTransform(scaleX: 1, y: 1)
                        self.mapBaseView.isHidden = false
                        UIView.animate(withDuration: 0.1, delay: 0.0, options: [], animations: {
                            self.mapBaseView.alpha = 1
                            self.mapBaseView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                        }) { (completed) in
                            self.mapBaseView.transform = CGAffineTransform(scaleX: 1, y: 1)
                            completion?()
                        }
                    }
                }
            }
        }
    }
    
    private func stopAnimation(completion: (() -> ())? = nil){
        self.startAnimating = false
        UIView.animate(withDuration: 0.1, delay: 0.0, options: [], animations: {
            self.containerView.alpha = 0.0
        }) { (completed) in
            self.mapBaseView.isHidden = true
            UIView.animate(withDuration: 0.1, delay: 0.0, options: [], animations: {
                self.mapBaseView.alpha = 0.0
            }) { (completed) in
                self.attractionsBaseView.isHidden = true
                UIView.animate(withDuration: 0.1, delay: 0.0, options: [], animations: {
                    self.attractionsBaseView.alpha = 0.0
                }) { (completed) in
                    self.eventsBaseView.isHidden = true
                    UIView.animate(withDuration: 0.1, delay: 0.0, options: [], animations: {
                        self.eventsBaseView.alpha = 0.0
                    }) { (completed) in
                        self.hotspotsBaseView.isHidden = true
                        UIView.animate(withDuration: 0.1, delay: 0.0, options: [], animations: {
                            self.hotspotsBaseView.alpha = 0.0
                        }) { (completed) in
                            completion?()
                        }
                    }
                }
            }
        }
    }
    
    private func getHomeContentRequest(){
        
        self.viewModel.homeContentRequest()?.asObservable().subscribe(onNext: { (response) in
            
        }, onError: { (error) in
            print(error.localizedDescription)
        }, onCompleted: {
            print("Completed")
        }).disposed(by: self.disposeBag)
    }
    
    //MARK: - Actions
    @objc private func bellmanBtnBtnDidTapped(){
        DispatchQueue.main.async {
            if self.startAnimating == false{
                self.startAnimation()
            }else{
                self.stopAnimation()
            }
        }
    }
    
    @objc private func hotspotsBtnDidTapped(){
        self.stopAnimation {
            print("Hotspots pressed")
        }
    }
    
    @objc private func eventsBtnDidTapped(){
        self.stopAnimation {
            print("Events pressed")
        }
    }
    
    @objc private func attractionsBtnDidTapped(){
        self.stopAnimation {
            print("Attractions pressed")
        }
    }
    
    @objc private func mapBtnDidTapped(){
        self.stopAnimation {
            print("Map pressed")
        }
    }
}


//MARK: - TableView DataSource
extension HomeVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIndentifier, for: indexPath) as? HomeContentCell else {return UITableViewCell()}
        
        if indexPath.row == 0{
            cell.homeContentType = .hotspots
        }
        if indexPath.row == 1{
            cell.homeContentType = .events
        }
        if indexPath.row == 2{
            cell.homeContentType = .attractions
        }
        
        return cell
    }
}

//MARK: - TableView Delegate
extension HomeVC: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

