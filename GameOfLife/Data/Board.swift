//
//  Board.swift
//  GameOfLife
//
//  Created by David Sica on 1/6/20.
//  Copyright © 2020 Sufficient Magic Software LLC. All rights reserved.
//

import Foundation

class Board: ObservableObject {
    let squareLength: Int
    private(set) var generation: Int
    private var deadlocked = false
    @Published private(set) var tiles: [Tile] = []
    private var initAllDead = false
    
    init(squareLength: Int, withRandomState: Bool = false) {
        self.squareLength = squareLength
        generation = 0
        
        if withRandomState {
            initWithRandomState()
        }
        else {
            initWithBlankState()
        }
    }
        
    func isGameDead() -> Bool {
        guard tiles.count > 0 else {
            return false
        }
        
        return !hasLiveTiles()
    }
    
    func isGameDeadlocked() -> Bool {
        guard tiles.count > 0 else {
            return false
        }
        
        return deadlocked
    }
        
    func initTiles(initialState: [Bool]) {
        guard Double(initialState.count).squareRoot() == Double(squareLength) else {
            print("Initial State does not define a square in size.")
            return
        }
        
        for tile in 0..<initialState.count {
            let tileId = tile + 1
            let newTile = Tile(identifier: tileId, liveState: initialState[tile])
            tiles.append(newTile)
        }
    }
    
    func spawnNewGeneration() {
        if generation == 0 {
            initAllDead = false
        }
        
        var newTiles: [Tile] = []
        
        for tile in tiles {
            var surroundingLiveTiles = 0
            let tileIndex = tile.identifier - 1
            
            if tile.hasTopLeftNeighbor(squareLenth: squareLength) &&
                tiles[tileIndex - (squareLength + 1)].liveState {
                surroundingLiveTiles += 1
            }
            
            if tile.hasTopNeighbor(squareLenth: squareLength) &&
                tiles[tileIndex - squareLength].liveState {
                surroundingLiveTiles += 1
            }
            
            if tile.hasTopRightNeighbor(squareLenth: squareLength) &&
                tiles[tileIndex - (squareLength - 1)].liveState {
                surroundingLiveTiles += 1
            }
            
            if tile.hasLeftNeighbor(squareLenth: squareLength) &&
                tiles[tileIndex - 1].liveState {
                surroundingLiveTiles += 1
            }
            
            if tile.hasRightNeighbor(squareLenth: squareLength) &&
                tiles[tileIndex + 1].liveState {
                surroundingLiveTiles += 1
            }
            
            if tile.hasBottomLeftNeighbor(squareLenth: squareLength) &&
                tiles[tileIndex + (squareLength - 1)].liveState {
                surroundingLiveTiles += 1
            }
            
            if tile.hasBottomNeighbor(squareLenth: squareLength) &&
                tiles[tileIndex + squareLength].liveState {
                surroundingLiveTiles += 1
            }
            
            if tile.hasBottomRightNeighbor(squareLenth: squareLength) &&
                tiles[tileIndex + (squareLength + 1)].liveState {
                surroundingLiveTiles += 1
            }
            
            let newTile = Tile(
                identifier: tile.identifier,
                previousLiveState: tile.liveState,
                previousSurroundingLiveTiles: surroundingLiveTiles
            )
            newTiles.append(newTile)
        }
        
        if newTiles == self.tiles {
            deadlocked = true
        }
        else {
            generation += 1
        }
        
        self.tiles = newTiles
    }
    
    func initRandom() {
        self.tiles = []
        generation = 1
        deadlocked = false
        initAllDead = false
        initWithRandomState()
    }
    
    func reset() {
        self.tiles = []
        generation = 0
        deadlocked = false
        initWithBlankState()
        initAllDead.toggle()
    }
    
    func toggleTile(identifier: Int) {
        var tile = tiles[identifier]
        tile.toggleLiveState()
        tiles[identifier] = tile
    }
}

extension Board {
    private func initWithRandomState() {
        var randomState: [Bool] = []
        for _ in 0..<(squareLength * squareLength) {
            randomState.append(Bool.random())
        }
        
        initTiles(initialState: randomState)
    }
    
    private func initWithBlankState() {
        var randomState: [Bool] = []
        for _ in 0..<(squareLength * squareLength) {
            randomState.append(!initAllDead)
        }
        
        initTiles(initialState: randomState)
    }

    private func hasLiveTiles() -> Bool {
        return tiles.filter({ $0.liveState }).count > 0
    }
}
