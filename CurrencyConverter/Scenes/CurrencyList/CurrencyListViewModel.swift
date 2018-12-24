//
//  CurrencyListViewModel.swift
//  CurrencyConverter
//
//  Created by Gokhan Gultekin on 14.12.2018.
//  Copyright © 2018 Gokhan Gultekin. All rights reserved.
//

import Foundation

final class CurrencyListViewModel: CurrencyListViewModelProtocol {
    
    weak var delegate: CurrencyListViewModelDelegate?
    private let service: LatestRatesServiceProtocol
    private var rates: LatestRatesResponse? = nil

    init(service: LatestRatesServiceProtocol) {
        self.service = service
    }
    
    func load(base: String) {
        notify(.updateTitle("Test"))
        notify(.showLoading(true))
        
        service.fetchLatestRates(base: base) { (result) in
            self.notify(.showLoading(false))
            
            switch result {
            case .success(let response):
                self.rates = response
                let presentation = CurrencyListPresentation(base: response.base, date: response.date, rates: response.rates)
                self.notify(.showLatestRates(presentation))
            case .failure(let error):
                print(error) // TODO: Handle this.
            }
        }
    }
    
    private func notify(_ output: CurrencyListViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
    
    public func convert(from symbol: String) -> String {
        return ""
    }
}

