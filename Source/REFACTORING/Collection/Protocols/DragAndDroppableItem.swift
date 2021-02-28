//
//  DragAndDroppableItem.swift
//  ReactiveDataDisplayManager
//
//  Created by Anton Eysner on 18.02.2021.
//  Copyright © 2021 Александр Кравченков. All rights reserved.
//

import UIKit

@available(iOS 11.0, *)
public protocol DragAndDroppableItem {
    typealias DraggableIdentifier = NSItemProviderWriting

    var draggableIdentifier: NSItemProviderWriting { get set }
}
