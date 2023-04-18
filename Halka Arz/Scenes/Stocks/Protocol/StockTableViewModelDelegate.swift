//
//  StockTableViewModelDelegate.swift
//  Halka Arz
//
//  Created by Emir Alkal on 18.04.2023.
//

import APIClient
import UIKit

protocol StockTableViewModelDelegate: AnyObject {
    func didUpdateStock(_ delegate: StockTableViewModel, data: [StockData])
    func didUpdateStockWithError(_ delegate: StockTableViewModel, error: Error)
    func stockTableLoading(_ delegate: StockTableViewModel)
}
