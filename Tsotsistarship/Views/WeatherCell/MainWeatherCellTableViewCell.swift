//
//  MainWeatherCellTableViewCell.swift
//  Tsotsistarship
//
//  Created by Lesego Mogorosi on 2023/03/08.
//

import UIKit

class MainWeatherCellTableViewCell: UITableViewCell {
    
    public static var identifier : String {
        get{
            return "MainWeatherCellTableViewCell"
        }
    }
    
    public static func register() -> UINib {
       UINib(nibName: "MainWeatherCellTableViewCell" , bundle: nil)
    }
    
    @IBOutlet weak var backview: UIView!
    
    @IBOutlet weak var marsImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var TempLabel: UILabel!
    
    @IBOutlet weak var safetyLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backview.addBorder(color: .label, width: 1)
        backview.round()
        
        marsImage.round(5)
    }
    
    func setupCell(viewModel: WeatherTableCellViewModel){
        self.dateLabel.text = viewModel.date
        self.TempLabel.text = viewModel.temp
        self.windLabel.text = viewModel.windSpeed
        self.safetyLabel.text = viewModel.safe
        self.humidityLabel.text = viewModel.humidity
        
    }
    
}


extension UIView {
    func round( _ radius: CGFloat = 10){
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func addBorder(color: UIColor, width:CGFloat){
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}
