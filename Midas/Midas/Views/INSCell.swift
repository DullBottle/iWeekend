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
        static let label = UIFont.systemFont(ofSize: 12)
        static let indexLabel = UIFont.systemFont(ofSize: 10)
    }
    
    // MARK: UI.
    
    fileprivate let topLine = UIView().then {
        $0.backgroundColor = .ins_lightGray
    }
    
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
    
    let indexLabel = UILabel().then {
        $0.textColor = .ins_darkBlack
        $0.font = Font.indexLabel
        $0.numberOfLines = 1
        $0.textAlignment = .center
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
        contentView.addSubview(topLine)
        contentView.addSubview(avatarView)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(indexLabel)
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
                make.left.right.equalToSuperview()
                make.bottom.equalTo(-15.f)
                make.height.equalTo(height)
            }
        }).disposed(by: self.disposeBag)
        
        reactor.state.map { $0.imageURLs }.subscribe(onNext: { [weak self] images in
            if self?.indexLabel.text == nil {
                self?.indexLabel.text = "1/\(images.count)"
            }
            self?.imageView.page = images.count
            self?.imageView.URLs = images
        }).disposed(by: self.disposeBag)
        
        imageView.scrollView.rx.didEndDecelerating.subscribe(onNext: { [weak self] in
            let page = Int((self?.imageView.scrollView.contentOffset.x)! / (self?.imageView.width)!) + 1
            self?.indexLabel.text = "\(page)/\((self?.imageView.page)!)"
        }).disposed(by: self.disposeBag)
    }
    
    // MARK: Size
    
    class func size(width: CGFloat, reactor: INSCellReactor) -> CGSize {
        var height = ceil(reactor.initialState.tweets.height(thatFitsWidth: width, font: Font.label, maximumNumberOfLines: 0))
        let h = ceil((reactor.initialState.dimensions.height * width) / reactor.initialState.dimensions.width)
        height = height + h + Metric.margin * 2 + Metric.avatarSize + 12.f + 15.f
        return CGSize(width: width, height: height)
    }
    
    func setupConstraints() {
        
        // topLine.
        topLine.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(1.f)
        }
        
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
            make.top.equalTo(usernameLabel.snp.bottom).offset(Metric.margin + 12.f)
            make.right.equalTo(-Metric.margin)
        }
        
        // indexLabel.
        indexLabel.snp.makeConstraints { make in
            make.right.equalTo(-Metric.margin)
            make.bottom.equalTo(-2.f)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}








