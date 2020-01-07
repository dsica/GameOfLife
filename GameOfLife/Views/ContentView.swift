//
//  ContentView.swift
//  GameOfLife
//
//  Created by David Sica on 1/6/20.
//  Copyright © 2020 Sufficient Magic Software LLC. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var board: Board
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    TileView(tile: board.tiles[0])
                        .frame(width: 50.0, height: 50.0)
                    TileView()
                        .frame(width: 50.0, height: 50.0)
                }
                HStack {
                    TileView()
                        .frame(width: 50.0, height: 50.0)
                    TileView()
                        .frame(width: 50.0, height: 50.0)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(board: Board(squareLength: 10))
    }
}
