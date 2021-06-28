//
//  MeditateScrollViewLayout.swift
//  Meditation
//
//  Created by Aleksandr on 07/12/2020.
//  Copyright © 2020 Aleksandr. All rights reserved.
//

import UIKit

class MeditateScrollViewLayout: UICollectionViewLayout {

    var contentBounds = CGRect.zero //размер моего контента
    var cachedAttributes = [UICollectionViewLayoutAttributes]()
    var segmentFrame = CGRect()

    override func prepare() {
        super.prepare()

        guard let collectionView = collectionView else { return }

        cachedAttributes.removeAll()
        contentBounds = CGRect(origin: .zero, size: collectionView.bounds.size)

        let countSection = collectionView.numberOfSections
        
        var currentSection = 0
        var currentItem = 0
        var lastFrame: CGRect = .zero
        
        while currentSection < countSection {
            
            if currentSection == 0 {
                let rect = CGRect(x: 0, y: 0, width: collectionView.bounds.width, height: 150)
                let attributes = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: 0, section: 0))
                attributes.frame = rect
                cachedAttributes.append(attributes)
                contentBounds = contentBounds.union(rect)
                
            }
            
            if currentSection == 1 {
                let rect = CGRect(x: 0, y: 150 + 10, width: collectionView.bounds.width, height: 130)
                let attributes = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: 0, section: 1))
                attributes.frame = rect
                cachedAttributes.append(attributes)
                contentBounds = contentBounds.union(rect)
                
            }
            
            if currentSection == 2 {
                let rect = CGRect(x: 0, y: 150 + 10 + 130 + 10, width: collectionView.bounds.width, height: 115)
                let attributes = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: 0, section: 2))
                attributes.frame = rect
                cachedAttributes.append(attributes)
                contentBounds = contentBounds.union(rect)
                
            }
            
            if currentSection == 3 {
            let countItems = collectionView.numberOfItems(inSection: 3)
            var segmentFrame = CGRect(x: 0, y: 150 + 10 + 130 + 10 + 115 + 9, width: 0, height: 0)
           
            while currentItem < countItems {
                
                var rect = CGRect()
                let widthItem = (collectionView.bounds.width - 54) / 2
                
                if currentItem % 4 == 0 {
                    rect = CGRect(x: 18, y: segmentFrame.minY + 9, width: widthItem, height: 210)
                }
                if currentItem % 4 == 1 {
                    rect = CGRect(x: widthItem + 36, y: segmentFrame.minY + 9, width: widthItem, height: 167)
                }
                if currentItem % 4 == 2 {
                    rect = CGRect(x: 18, y: segmentFrame.minY + 234, width: widthItem, height: 167)
                }
                if currentItem % 4 == 3 {
                    rect = CGRect(x: widthItem + 36, y: segmentFrame.minY + 191, width: widthItem, height: 210)
                    segmentFrame = CGRect(x: 0, y: rect.maxY + 9, width: 0, height: 0)
                    lastFrame = rect
                }
                    
                let attributes = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: currentItem, section: 3))
                attributes.frame = rect
                
                lastFrame = rect
                
                cachedAttributes.append(attributes)
                contentBounds = contentBounds.union(lastFrame)
                
                currentItem += 1
                
            }
            }
            
            currentSection += 1
            currentItem = 0
        }
    }
    
    override var collectionViewContentSize: CGSize {
        return contentBounds.size
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cachedAttributes[indexPath.item]
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        guard let collectionView = collectionView else { return false }
        return !newBounds.size.equalTo(collectionView.bounds.size)
    }
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributesArray = [UICollectionViewLayoutAttributes]()

        // Find any cell that sits within the query rect. Найдите любую ячейку, которая находится в прямоугольнике запроса.
        guard let lastIndex = cachedAttributes.indices.last,
              let firstMatchIndex = binSearch(rect, start: 0, end: lastIndex) else { return attributesArray }

        // Starting from the match, loop up and down through the array until all the attributes
        // have been added within the query rect. Начиная с совпадения, выполните цикл вверх и вниз по массиву, пока все атрибуты были добавлены в прямоугольник запроса.
        for attributes in cachedAttributes[..<firstMatchIndex].reversed() {
            guard attributes.frame.maxY >= rect.minY else { break }
            attributesArray.append(attributes)
        }

        for attributes in cachedAttributes[firstMatchIndex...] {
            guard attributes.frame.minY <= rect.maxY else { break }
            attributesArray.append(attributes)
        }

        return attributesArray
    }

    // Perform a binary search on the cached attributes array. Выполните двоичный поиск в массиве кэшированных атрибутов.
    func binSearch(_ rect: CGRect, start: Int, end: Int) -> Int? {
        if end < start { return nil }

        let mid = (start + end) / 2
        let attr = cachedAttributes[mid]

        if attr.frame.intersects(rect) {
            return mid
        } else {
            if attr.frame.maxY < rect.minY {
                return binSearch(rect, start: (mid + 1), end: end)
            } else {
                return binSearch(rect, start: start, end: (mid - 1))
            }
        }
    }
}

