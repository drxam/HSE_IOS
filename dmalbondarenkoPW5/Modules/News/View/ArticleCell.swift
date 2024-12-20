//
//  ArticleCell.swift
//  dmalbondarenkoPW5
//
//  Created by dread on 15.12.2024.
//

import UIKit

class ArticleCell: UITableViewCell {
    // MARK: - Constants
    static let reuseId: String = Constants.ArticleCell.reuseId
    
    // MARK: - Variables
    var image = UIImageView()
    var title = UILabel()
    var descr = UILabel()
    var timeOfReading = UILabel()
    var date = UILabel()
    private var timeWrap = UIView()
    private var dateWrap = UIView()
    private var currentURL: URL?
    private var imageTask: URLSessionDataTask?
    private var gradientLayer: CAGradientLayer?
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public funcs
    func configure(_ model: ArticleModel) {
        title.text = model.title
        descr.text = model.announce
        timeOfReading.text = model.timeOfReading
        date.text = model.formattedDate
        
        guard let imageURL = model.img else {
            image.image = nil
            return
        }
        
        currentURL = imageURL.url
        
        ImageLoader.shared.loadImage(imageURL) { [weak self] loadedImage in
            guard self?.currentURL == imageURL.url else { return }
            self?.image.image = loadedImage
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer?.frame = image.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        image.image = nil
        currentURL = nil
    }
    
    // MARK: - Private funcs
    private func configureUI() {
        backgroundColor = .clear
        configureImage()
        configureDescription()
        configureTitle()
        configureTimeOfReading()
        configureDate()
    }
    
    private func configureImage() {
        addSubview(image)
        image.layer.cornerRadius = Constants.ArticleCell.imageCornerRadius
        image.clipsToBounds = true
        image.pin(to: self, Constants.ArticleCell.imagePin)
        addGradientToImageView(imageView: image)
    }
    
    private func configureDescription() {
        image.addSubview(descr)
        descr.font = Constants.ArticleCell.descriptionFont
        descr.textColor = Constants.ArticleCell.descriptionTextColor
        descr.lineBreakMode = Constants.ArticleCell.descriptionLineBreakMode
        descr.numberOfLines = .zero
        
        descr.pinHorizontal(to: image, Constants.ArticleCell.descriptionHorizontalOffset)
        descr.pinBottom(to: image.bottomAnchor, Constants.ArticleCell.descriptionBottomOffset)
        descr.setHeight(Constants.ArticleCell.descriptionHeight)
    }
    
    private func configureTitle() {
        image.addSubview(title)
        title.font = Constants.ArticleCell.titleFont
        title.textColor = Constants.ArticleCell.titleTextColor
        title.lineBreakMode = Constants.ArticleCell.titleLineBreakMode
        title.numberOfLines = .zero
        
        title.pinHorizontal(to: image, Constants.ArticleCell.titleHorizontalOffset)
        title.pinBottom(to: descr.topAnchor)
        title.setHeight(Constants.ArticleCell.titleHeight)
    }
    
    private func configureTimeOfReading() {
        image.addSubview(timeWrap)
        timeWrap.backgroundColor = Constants.ArticleCell.timeBackgroundColor
        timeWrap.layer.cornerRadius = Constants.ArticleCell.timeCornerRadius
        timeWrap.pinTop(to: image.topAnchor, Constants.ArticleCell.timeTopOffset)
        timeWrap.pinRight(to: image.trailingAnchor, Constants.ArticleCell.timeRightOffset)
        timeWrap.setHeight(Constants.ArticleCell.timeHeight)
        timeWrap.setWidth(Constants.ArticleCell.timeWidth)
        
        timeWrap.addSubview(timeOfReading)
        timeOfReading.font = Constants.ArticleCell.timeFont
        timeOfReading.textColor = Constants.ArticleCell.timeTextColor
        timeOfReading.pinCenter(to: timeWrap)
    }
    
    private func configureDate() {
        image.addSubview(dateWrap)
        dateWrap.backgroundColor = Constants.ArticleCell.dateBackgroundColor
        dateWrap.layer.cornerRadius = Constants.ArticleCell.dateCornerRadius
        dateWrap.pinTop(to: image.topAnchor, Constants.ArticleCell.dateTopOffset)
        dateWrap.pinLeft(to: image.leadingAnchor, Constants.ArticleCell.dateLeftOffset)
        dateWrap.setHeight(Constants.ArticleCell.dateHeight)
        dateWrap.setWidth(Constants.ArticleCell.dateWidth)
        
        dateWrap.addSubview(date)
        date.font = Constants.ArticleCell.dateFont
        date.textColor = Constants.ArticleCell.dateTextColor
        date.pinCenter(to: dateWrap)
    }
    
    private func addGradientToImageView(imageView: UIImageView) {
        gradientLayer?.removeFromSuperlayer()
        
        let gradient = CAGradientLayer()
        gradient.colors = Constants.ArticleCell.gradientColors
        gradient.locations = Constants.ArticleCell.gradientLocations
        imageView.layer.addSublayer(gradient)
        gradientLayer = gradient
    }
}
