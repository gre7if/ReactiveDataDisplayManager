//
//  CellHeightGettable.swift
//  ReactiveDataDisplayManager
//
//  Created by Alexander Filimonov on 02/03/2020.
//  Copyright © 2020 Александр Кравченков. All rights reserved.
//

import Foundation

/// Protocol for calculating height of element according to the model
public protocol AccurateHeight: Configurable {
    static func getHeight(forWidth width: CGFloat, with model: Model) -> CGFloat
}

/// Protocol for calculating width of element according to the model
public protocol AccurateWidth: Configurable {
    static func getWidth(forHeight height: CGFloat, with model: Model) -> CGFloat
}
