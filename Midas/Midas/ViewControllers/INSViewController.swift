//
//  INSViewController.swift
//  Midas
//
//  Created by __End on 2018/1/11.
//  Copyright © 2018年 Dressrose. All rights reserved.
//

import UIKit
import ReusableKit
import ReactorKit

class INSViewController: BaseViewController, View {
    
    // MARK: Properties.
    
    fileprivate var data: [Ins] = [Ins]()           // the data source array.
    
    fileprivate var reactors: [INSCellReactor] = [INSCellReactor]()           // the reactor array.
    
    // MARK: Constants.
    
    fileprivate struct Reusable {
        static let insCell = ReusableCell<INSCell>()
    }
    
    fileprivate struct Metric {
        static let sectionInsetLeftRight = 0.f
        static let sectionItemSpacing = 0.f
    }
    
    // MARK: UI.
    
    let refreshControl = RefreshControl()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.backgroundColor = .white
        $0.register(Reusable.insCell)
    }
    
    // MARK: Initialize.
    
    init(reactor: InsViewReactor) {
        defer { self.reactor = reactor }
        super.init()
        view.addSubview(collectionView)
        collectionView.refreshControl = refreshControl
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View Life.
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(collectionView)
    }

    override func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: Bind.
    
    func bind(reactor: InsViewReactor) {
        
        // Action.
        self.rx.viewDidLoad
            .map { .refresh }
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        self.refreshControl.rx.controlEvent(.valueChanged)
            .map { .refresh }
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        // State.
        reactor.state.map { $0.isRefreshing }
            .distinctUntilChanged()
            .bind(to: refreshControl.rx.isRefreshing)
            .disposed(by: self.disposeBag)
        
        reactor.state.map { $0.list }.subscribe(onNext: { [weak self] data in
            self?.data = data
            self?.collectionView.reloadData()
        }).disposed(by: self.disposeBag)
        
        // View.
        collectionView.rx.setDelegate(self).disposed(by: self.disposeBag)
        collectionView.rx.setDataSource(self).disposed(by: self.disposeBag)
    }
    
}

extension INSViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int { return 1 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return data.count }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(Reusable.insCell, for: indexPath)
        let ins = self.data[indexPath.item]
        let reactor = INSCellReactor(ins)
        reactors.insert(reactor, at: indexPath.item)
        cell.reactor = reactor
        return cell
    }
}

extension INSViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets
    {
        let topBottom = Metric.sectionItemSpacing
        let leftRight = Metric.sectionInsetLeftRight
        return UIEdgeInsets(top: topBottom, left: leftRight, bottom: topBottom, right: leftRight)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return Metric.sectionItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return Metric.sectionItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return Reusable.insCell.class.size(width: collectionView.width)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForFooterInSection section: Int) -> CGSize
    {
        return CGSize(width: collectionView.width, height: 44)
    }
}

















