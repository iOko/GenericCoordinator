//
//  Coordinator.swift
//  Coordinator
//
//  Created by Kyle Ozaltug on 2018-10-05.
//  Copyright © 2018 Kyle Ozaltug. All rights reserved.
//

import Foundation

protocol Navigatable {
    associatedtype ViewModel
    associatedtype Controller
    var viewModel: ViewModel { get }
    var controller: Controller { get }
    
    func submitAndNavigate()
}

extension Navigatable {
    func submitAndNavigate() {
        print(viewModel)
        print(controller)
    }
}

struct Navigator<ViewModel, Controller>: Navigatable {
    var viewModel: ViewModel
    var controller: Controller
}

extension Navigator where ViewModel == GenericViewModel<Int>, Controller == FirstViewController {
    func submitAndNavigate() {
        let secondViewModel = GenericViewModel(value: "test 123")
        let secondViewController = SecondViewController.create(with: secondViewModel)
        controller.navigationController?.pushViewController(secondViewController, animated: true)
    }
}

extension Navigator where ViewModel == GenericViewModel<String>, Controller == SecondViewController {
    func submitAndNavigate() {
        print("viewModel is \(viewModel), value is: \(viewModel.value)")
        controller.navigationController?.popViewController(animated: true)
        print("Dismissing \(controller)")
    }
}
