//
//  StockCell.swift
//  Halka Arz
//
//  Created by Emir Alkal on 18.04.2023.
//

import UIKit
import APIClient

final class StockCell: UITableViewCell {
    static let cellID = "StockCell"
    var stock: StockData? {
        didSet {
            logoImageView.sd_setImage(with: URL(string: stock!.media.icon))
            logoImageView.layer.cornerRadius = 45
            logoImageView.layer.masksToBounds = true
            logoImageView.layer.borderWidth = 0.3
            logoImageView.layer.borderColor = UIColor.lightGray.cgColor
            
            symbolLabel.text = stock!.shortCode
            symbolLabel.font = .poppin500(size: 14)
            symbolLabel.textColor = #colorLiteral(red: 0.1010758653, green: 0.1133193746, blue: 0.1299102902, alpha: 1)
            nameLabel.text = stock!.company
            nameLabel.font = .poppin400(size: 13)
            nameLabel.textColor = #colorLiteral(red: 0.4820557833, green: 0.5377379656, blue: 0.5890749693, alpha: 1)
            
            dateLabel.text = stock!.date
            dateLabel.font = .poppin400(size: 11)
            dateLabel.textColor = #colorLiteral(red: 0.1010758653, green: 0.1133193746, blue: 0.1299102902, alpha: 1)
        }
    }
    
    private let logoImageView = UIImageView(contentMode: .scaleAspectFit)
    private let symbolLabel = UILabel()
    private let nameLabel = UILabel()
    private let dateLabel = UILabel()
    
    private lazy var stackView = UIStackView(axis: .vertical, spacing: 0, distribution: .fillProportionally, alignment: .leading, subviews: [
        symbolLabel, nameLabel, dateLabel
    ])
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        nameLabel.numberOfLines = 0
    }
    
    private func setupView() {
        contentView.addSubview(logoImageView)
        logoImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(90)
        }
        
        contentView.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.top)
            make.bottom.equalTo(logoImageView.snp.bottom)
            make.leading.equalTo(logoImageView.snp.trailing).offset(12)
            make.trailing.equalToSuperview().offset(-5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
