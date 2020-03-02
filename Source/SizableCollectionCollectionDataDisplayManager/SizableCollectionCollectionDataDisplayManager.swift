//
//  SizableCollectionCollectionDataDisplayManager.swift
//  ReactiveDataDisplayManager
//
//  Created by Alexander Filimonov on 02/03/2020.
//  Copyright © 2020 Александр Кравченков. All rights reserved.
//

import Foundation

public class SizableCollectionCollectionDataDisplayManager: BaseCollectionDataDisplayManager {

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let sizableCell = cellGenerators[indexPath.section][indexPath.row] as? SizableCollectionCellGenerator else {
            return .zero
        }
        return sizableCell.getSize()
    }

}
