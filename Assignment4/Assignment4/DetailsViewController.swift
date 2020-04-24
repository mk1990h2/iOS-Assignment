//
//  DetailsViewController.swift
//  Assignment4
//
//  Created by 佐藤美佳 on 2020/04/24.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var city: City!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let countryLabel = BaseTitleLabel()
        countryLabel.text = "Country"
        let countryIcon = BaseContentLabel()
        countryIcon.text = getCountryFlagEmoji()
        let cityLabel = BaseTitleLabel()
        cityLabel.text = "City"
        let cityName = BaseContentLabel()
        cityName.text = city.name
        let temperatureLabel = BaseTitleLabel()
        temperatureLabel.text = "Temperature"
        let tempertureName = BaseContentLabel()
        tempertureName.text = String(city.temp)
        let summaryLabel = BaseTitleLabel()
        summaryLabel.text = "Summary"
        let summaryName = BaseContentLabel()
        summaryName.text = city.summary

        stackView.addArrangedSubview(countryLabel)
        stackView.addArrangedSubview(countryIcon)
        stackView.addArrangedSubview(cityLabel)
        stackView.addArrangedSubview(cityName)
        stackView.addArrangedSubview(temperatureLabel)
        stackView.addArrangedSubview(tempertureName)
        stackView.addArrangedSubview(summaryLabel)
        stackView.addArrangedSubview(summaryName)

        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        
    }
    
    func getCountryFlagEmoji() -> String {
        switch city.icon {
        case "canada": return "🇨🇦"
        case "italy": return "🇮🇹"
        case "japan": return "🇯🇵"
        case "brazil": return "🇧🇷"
        case "skorea": return "🇰🇷"
        default: return ""
        }
    }

}

class BaseTitleLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init() {
        self.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = UIFont(name: "HelveticaNeue-Bold", size: 15)
        self.textAlignment = .center
        self.heightAnchor.constraint(equalToConstant: 20).isActive = true
        self.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

class BaseContentLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init() {
        self.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = UIFont(name: "Helvetica Neue", size: 20)
        self.textAlignment = .center
        self.heightAnchor.constraint(equalToConstant: 20).isActive = true
        self.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
