//
//  Tile.swift
//  GameOfLife
//
//  Created by David Sica on 1/6/20.
//  Copyright © 2020 Sufficient Magic Software LLC. All rights reserved.
//

import Foundation

struct Tile: Equatable {
    let identifier: Int
    private(set) var liveState: Bool
    
    init(identifier: Int, liveState: Bool, surroundingLiveTiles: Int = 0) {
        self.identifier = identifier
        self.liveState = liveState
    }
    
    init(identifier: Int, previousLiveState: Bool, previousSurroundingLiveTiles: Int) {
        self.identifier = identifier
        self.liveState = Tile.futureLiveState(
            liveState: previousLiveState,
            surroundingLiveTiles: previousSurroundingLiveTiles
        )
    }
    
    mutating func toggleLiveState() {
        liveState.toggle()
    }

    func hasTopLeftNeighbor(squareLenth: Int) -> Bool {
        return !isTopEdge(squareLength: squareLenth) && !isLeftEdge(squareLength: squareLenth)
    }
    
    func hasTopNeighbor(squareLenth: Int) -> Bool {
        return !isTopEdge(squareLength: squareLenth)
    }
    
    func hasTopRightNeighbor(squareLenth: Int) -> Bool {
        return !isTopEdge(squareLength: squareLenth) && !isRightEdge(squareLength: squareLenth)
    }

    func hasLeftNeighbor(squareLenth: Int) -> Bool {
        return !isLeftEdge(squareLength: squareLenth)
    }

    func hasRightNeighbor(squareLenth: Int) -> Bool {
        return !isRightEdge(squareLength: squareLenth)
    }

    func hasBottomLeftNeighbor(squareLenth: Int) -> Bool {
        return !isBottomEdge(squareLength: squareLenth) && !isLeftEdge(squareLength: squareLenth)
    }

    func hasBottomNeighbor(squareLenth: Int) -> Bool {
        return !isBottomEdge(squareLength: squareLenth)
    }

    func hasBottomRightNeighbor(squareLenth: Int) -> Bool {
        return !isBottomEdge(squareLength: squareLenth) && !isRightEdge(squareLength: squareLenth)
    }
    
    func stringId() -> String {
        return String(identifier)
    }
}

extension Tile {
    static private func futureLiveState(liveState: Bool, surroundingLiveTiles: Int) -> Bool {
        if liveState && (surroundingLiveTiles == 2 || surroundingLiveTiles == 3) {
            return true
        }
        else if !liveState && surroundingLiveTiles == 3 {
            return true
        }
        else {
            return false
        }
    }

    private func isLeftEdge(squareLength: Int) -> Bool {
        if identifier == 1 {
            return true
        }
        
        guard identifier > squareLength else {
            return false
        }
        
        return (identifier - 1) % squareLength == 0
    }
    
    private func isRightEdge(squareLength: Int) -> Bool {
        return identifier % squareLength == 0
    }
    
    private func isTopEdge(squareLength: Int) -> Bool {
        return identifier <= squareLength
    }
    
    private func isBottomEdge(squareLength: Int) -> Bool {
        let size = squareLength * squareLength
        return identifier > size - squareLength
    }
}
