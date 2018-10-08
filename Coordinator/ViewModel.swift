//
//  ViewModel.swift
//  Coordinator
//
//  Created by Kyle Ozaltug on 2018-10-05.
//  Copyright © 2018 Kyle Ozaltug. All rights reserved.
//

import Foundation

protocol AnyViewModel {
    associatedtype T
    var value: T { get }
}

struct GenericViewModel<C>: AnyViewModel {
    var value: C
}

