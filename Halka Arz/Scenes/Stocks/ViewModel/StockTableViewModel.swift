//
//  StockTableViewModel.swift
//  Halka Arz
//
//  Created by Emir Alkal on 18.04.2023.
//

import APIClient
import UIKit

final class StockTableViewModel {
    
    weak var delegate: StockTableViewModelDelegate?
    
    func fetchStocks() {
        delegate?.stockTableLoading(self)
        APIClient.shared.getStocks { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.delegate?.didUpdateStock(self, data: success)
                }
            case .failure(let failure):
                DispatchQueue.main.async {
                    self.delegate?.didUpdateStockWithError(self, error: failure)
                }
            }
        }
    }
}
