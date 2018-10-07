//
//  ViewModelTests.swift
//  Coordinator
//
//  Created by Kyle Ozaltug on 2018-10-06.
//  Copyright © 2018 Kyle Ozaltug. All rights reserved.
//
@testable import Coordinator
import XCTest

class ViewModelTests: XCTestCase {
    
    func testExample() {
        let viewModel = FirstViewModel(value: 876)
        let coordinator = CCACoordinator(viewModel: viewModel, controller: self)
        XCTAssertTrue(coordinator.viewModel.value == 876)
    }
}
