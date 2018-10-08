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
    var viewModel: ViewModel { get }
    var controller: ControllerPresentable { get }
    
    func submitAndNavigate()
}

extension Navigatable {
    func submitAndNavigate() {
        print(viewModel)
        print(controller)
    }
}

struct Navigator<ViewModel>: Navigatable {
    var viewModel: ViewModel
    var controller: ControllerPresentable
}

extension Navigator where ViewModel == FirstViewModel {
    func submitAndNavigate() {
        
        //You shouldn't have full access to viewModel or viewController, it's wrong, I can change its properties
//        controller.label.text = "555"
        
        let secondViewModel = SecondViewModel(value: "test 123")
        
        let secondViewController = SecondViewController.create(with: secondViewModel)
        controller.navigator.pushViewController(secondViewController, animated: true)
    }
}

extension Navigator where ViewModel == SecondViewModel {
    func submitAndNavigate() {
        print("viewModel is \(viewModel), value is: \(viewModel.value)")
        controller.navigator.popViewController(animated: true)
        print("Dismissing \(controller)")
    }
}
