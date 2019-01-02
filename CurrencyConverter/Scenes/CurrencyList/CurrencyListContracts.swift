//
//  CurrencyListContracts.swift
//  CurrencyConverter
//
//  Created by Gokhan Gultekin on 14.12.2018.
//  Copyright © 2018 Gokhan Gultekin. All rights reserved.
//

import Foundation
import UIKit

protocol CurrencyListViewModelProtocol {
    var themeColor: UIColor { get set }
    var delegate: CurrencyListViewModelDelegate? { get set }
    func load(base: String)
    func actionButtonTapped(rate: Rate)
}

enum CurrencyListViewModelOutput {
    case updateTitle(String)
    case showLoading(Bool)
    case showLatestRates(CurrencyListPresentation)
}

enum CurrencyListViewRoute { }

protocol CurrencyListViewModelDelegate: class {
    func handleViewModelOutput(_ output: CurrencyListViewModelOutput)
}
