//
//  TileView.swift
//  GameOfLife
//
//  Created by David Sica on 1/6/20.
//  Copyright © 2020 Sufficient Magic Software LLC. All rights reserved.
//

import SwiftUI

struct TileView: View {
    var tile: Tile?
    
    var body: some View {
        Text(tile?.stringId() ?? "?")
            .fixedSize(horizontal: true, vertical: true)
            .frame(width: floor(UIScreen.main.bounds.width/11), height: floor(UIScreen.main.bounds.width/11))
            .font(.subheadline)
            .foregroundColor(.white)
            .background((tile?.liveState ?? false) ? Color.green : Color.red)
    }
}

struct TileView_Previews: PreviewProvider {
    static var previews: some View {
        TileView()
    }
}
