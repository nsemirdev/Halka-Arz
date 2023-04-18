//
//  ViewController.swift
//  Halka Arz
//
//  Created by Emir Alkal on 18.04.2023.
//

import UIKit
import APIClient
import SnapKit
import Lottie
import SDWebImage

final class StockTableController: UITableViewController {

    private let viewModel = StockTableViewModel()
    private var stocks: [StockData]?
    private let indicatorView = LottieAnimationView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTable()
        viewModel.delegate = self
        viewModel.fetchStocks()
    }
    
    private func setupTable() {
        tableView.register(StockCell.self, forCellReuseIdentifier: StockCell.cellID)
        tableView.separatorStyle = .none
        tableView.rowHeight = 130
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        view.addSubview(indicatorView)
        
        indicatorView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(100)
        }
    }
}

extension StockTableController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        stocks?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let stockCell = tableView.dequeueReusableCell(withIdentifier: StockCell.cellID, for: indexPath) as? StockCell else {
            fatalError("can not dequeue cell")
        }
        guard let stock = stocks?[indexPath.row] else {
            fatalError("no stock")
        }
        
        stockCell.stock = stock
        return stockCell
    }
}

extension StockTableController: StockTableViewModelDelegate {
    func stockTableLoading(_ delegate: StockTableViewModel) {
        indicatorView.setupAndPlay(with: "spinner")
    }
    
    func didUpdateStock(_ delegate: StockTableViewModel, data: [StockData]) {
        stocks = data
        indicatorView.stop()
        indicatorView.removeFromSuperview()
        tableView.reloadData()
    }
    
    func didUpdateStockWithError(_ delegate: StockTableViewModel, error: Error) {
        //MARK: TODO
        print(#function)
    }
}
