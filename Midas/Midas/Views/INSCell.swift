//
//  INSCell.swift
//  Midas
//
//  Created by __End on 2018/1/15.
//  Copyright © 2018年 Dressrose. All rights reserved.
//

import UIKit
import ReactorKit

class INSCell: BaseCollectionViewCell, View {
    
    // MARK: Constraints.
    
    fileprivate struct Metric {
        static let margin = 7.f
        static let avatarSize = 40.f
    }
    
    fileprivate struct Font {
        static let label = UIFont.systemFont(ofSize: 10)
    }
    
    // MARK: UI.
    
    let avatarView = UIImageView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = Metric.avatarSize / 2
        $0.clipsToBounds = true
    }
    
    let usernameLabel = UILabel().then {
        $0.textColor = .ins_darkBlack
        $0.font = Font.label
        $0.numberOfLines = 1
    }
    
    var imageView = INSPageableView(frame: .zero)
    
    let tweetsLabel = UILabel().then {
        $0.textColor = .ins_darkBlack
        $0.font = Font.label
        $0.numberOfLines = 0
    }
    
    // MARK: Initialize.
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(avatarView)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(imageView)
        contentView.addSubview(tweetsLabel)
        setupConstraints()
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init(frame: .zero)
    }
    
    func bind(reactor: INSCellReactor) {
        
        // State
        reactor.state.map { $0.username }
            .bind(to: usernameLabel.rx.text)
            .disposed(by: self.disposeBag)
        
        reactor.state.map { $0.avatar }.subscribe(onNext: { [weak self] url in
            self?.avatarView.pin_setImage(from: URL(string: url)!)
        }).disposed(by: self.disposeBag)
        
        reactor.state.map { $0.tweets }
            .bind(to: tweetsLabel.rx.text)
            .disposed(by: self.disposeBag)
        
        reactor.state.map { $0.dimensions }.subscribe(onNext: { [weak self] dimension in
            let height = ceil(dimension.height * (UIScreen.main.bounds.width) / dimension.width)
            self?.imageView.snp.makeConstraints { make in
                make.left.right.equalTo(0)
                make.top.equalTo((self?.avatarView.snp.bottom)!).offset(Metric.margin)
                make.height.equalTo(height)
            }
        }).disposed(by: self.disposeBag)
        
        reactor.state.map { $0.imageURLs }.subscribe(onNext: { [weak self] images in
            self?.imageView.page = images.count
            self?.imageView.URLs = images
        }).disposed(by: self.disposeBag)
    }
    
    // MARK: Size
    
    class func size(width: CGFloat) -> CGSize {
        return CGSize(width: width, height: 550.f)
    }
    
    func setupConstraints() {
        
        // avatarView.
        avatarView.snp.makeConstraints { make in
            make.left.equalTo(Metric.margin)
            make.top.equalTo(Metric.margin)
            make.width.height.equalTo(Metric.avatarSize)
        }
        
        // usernameLabel.
        usernameLabel.snp.makeConstraints { make in
            make.left.equalTo(avatarView.snp.right).offset(Metric.margin)
            make.centerY.equalTo(avatarView.snp.centerY)
        }
        
        // tweetsLabel.
        tweetsLabel.snp.makeConstraints { make in
            make.left.equalTo(Metric.margin)
            make.top.equalTo(imageView.snp.bottom).offset(Metric.margin)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}








