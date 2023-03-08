//
//  MainViewController.swift
//  Tsotsistarship
//
//  Created by Lesego Mogorosi on 2023/03/07.
//

import UIKit

class MainViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    var viewModel: MainViewModel = MainViewModel()
    
    var cellDataSource: [WeatherTableCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        bindViewModel()
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getWeatherData()
    }
    
    func configView(){
        let backgroundImage = UIImage(named: "SPACE")
        let backgroundColor = UIColor(patternImage: backgroundImage!)
        self.view.backgroundColor = backgroundColor
        
        
        ApiCaller.shared.getWeatherData{ results in
            
            
        }
        
        setUpTableView()
        
    }
    
    
    func bindViewModel(){
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else{
                return
            }
            
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicator.startAnimating()
                }else{
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        
        
        viewModel.cellDataSource.bind {[weak self] weather in
            guard let self = self, let weather = weather else{
                return
            }
            self.cellDataSource = weather
            self.reloadTableView()
        }
    }


}


extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setUpTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.backgroundColor = .clear
        self.registerCells()
    }
    
    func registerCells(){
        tableView.register(MainWeatherCellTableViewCell.register(), forCellReuseIdentifier: MainWeatherCellTableViewCell.identifier)
    }
    
    func reloadTableView(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainWeatherCellTableViewCell.identifier) as? MainWeatherCellTableViewCell else{ return UITableViewCell()}
        
        let cellViewModel = cellDataSource[indexPath.row]
        cell.setupCell(viewModel: cellViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 150
    }
    
    
}
