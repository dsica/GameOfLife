//
//  ContentView.swift
//  GameOfLife
//
//  Created by David Sica on 1/6/20.
//  Copyright © 2020 Sufficient Magic Software LLC. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var board: Board
    
    var body: some View {
        VStack {
            buildBoardView()
            
            Spacer()
                .frame(height: 10.0)

            Text(getDeadText())
                .font(.callout)
                .fontWeight(.bold)
                .foregroundColor(Color.red)
                .padding(.top, 10.0)

            Spacer()
            
            VStack(alignment: .leading) {
                HStack(spacing: 10.0) {
                    Spacer()
                        .frame(width: 10.0)
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: 50.0, height: 50)
                    Text("Live State")
                        .font(.headline)
                    Spacer()
                }
                
                HStack(spacing: 10.0) {
                    Spacer()
                        .frame(width: 10.0)
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 50, height: 50)
                    Text("Dead State")
                        .font(.headline)
                }
            }
            
            
            Spacer()
                .frame(height: 20.0)
            
            HStack(spacing: 2.0) {
                Spacer()

                Button(action: {
                    withAnimation {
                        self.board.spawnNewGeneration()
                    }
                }) {
                    Text(board.generation == 0 ? "Start" : "Next")
                }.buttonStyle(GOLButtonStyle(disabled: (board.isGameDead() || board.isGameDeadlocked())))
                    .disabled((board.isGameDead() || board.isGameDeadlocked()))
                
                Spacer()

                Button(action: {
                    withAnimation {
                        self.board.reset()
                    }
                }) {
                    Text("Reset")
                }.buttonStyle(GOLButtonStyle())
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        self.board.initRandom()
                    }
                }) {
                    Text("Random")
                }.buttonStyle(GOLButtonStyle())
                
                Spacer()
            }

            Text("Current Generation: \(board.generation)")
                .font(.caption)
                .padding(.top, 10.0)
            
            Spacer()
                .frame(height: 10.0)
        }
    }
        
    struct GOLButtonStyle: ButtonStyle {
        var disabled: Bool = false
        
        public func makeBody(configuration: GOLButtonStyle.Configuration) -> some View {
            MyButton(configuration: configuration, color: disabled ? .gray : .blue)
        }
        
        struct MyButton: View {
            let configuration: GOLButtonStyle.Configuration
            let color: Color
            
            var body: some View {
                
                return configuration.label
                    .foregroundColor(.white)
                    .padding(15)
                    .background(RoundedRectangle(cornerRadius: 5).fill(color))
                    .compositingGroup()
                    .shadow(color: .black, radius: 3)
                    .opacity(configuration.isPressed ? 0.5 : 1.0)
            }
        }
    }
}

extension ContentView {
    private func getDeadText() -> String {
        if board.generation == 0 {
            return "Toggle Tiles, then Start!"
        }
        else if board.isGameDeadlocked() {
            return "It's ALIVE! (no further changes)"
        }
        else if board.isGameDead() {
            return "It's dead, Jim! (permanently)"
        }
        else {
            return ""
        }
    }
    
    private func buildBoardView() -> AnyView {
        return AnyView(
        VStack(spacing: 2.0) {
            HStack(spacing: 2.0) {
                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 0)
                    }
                }) {
                    TileView(tile: board.tiles[0])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 1)
                    }
                }) {
                    TileView(tile: board.tiles[1])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 2)
                    }
                }) {
                    TileView(tile: board.tiles[2])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 3)
                    }
                }) {
                    TileView(tile: board.tiles[3])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 4)
                    }
                }) {
                    TileView(tile: board.tiles[4])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 5)
                    }
                }) {
                    TileView(tile: board.tiles[5])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 6)
                    }
                }) {
                    TileView(tile: board.tiles[6])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 7)
                    }
                }) {
                    TileView(tile: board.tiles[7])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 8)
                    }
                }) {
                    TileView(tile: board.tiles[8])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 9)
                    }
                }) {
                    TileView(tile: board.tiles[9])
                }.disabled(board.generation > 0)
            }
            HStack(spacing: 2.0) {
                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 10)
                    }
                }) {
                    TileView(tile: board.tiles[10])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 11)
                    }
                }) {
                    TileView(tile: board.tiles[11])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 12)
                    }
                }) {
                    TileView(tile: board.tiles[12])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 13)
                    }
                }) {
                    TileView(tile: board.tiles[13])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 14)
                    }
                }) {
                    TileView(tile: board.tiles[14])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 15)
                    }
                }) {
                    TileView(tile: board.tiles[15])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 16)
                    }
                }) {
                    TileView(tile: board.tiles[16])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 17)
                    }
                }) {
                    TileView(tile: board.tiles[17])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 18)
                    }
                }) {
                    TileView(tile: board.tiles[18])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 19)
                    }
                }) {
                    TileView(tile: board.tiles[19])
                }.disabled(board.generation > 0)
            }
            HStack(spacing: 2.0) {
                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 20)
                    }
                }) {
                    TileView(tile: board.tiles[20])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 21)
                    }
                }) {
                    TileView(tile: board.tiles[21])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 22)
                    }
                }) {
                    TileView(tile: board.tiles[22])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 23)
                    }
                }) {
                    TileView(tile: board.tiles[23])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 24)
                    }
                }) {
                    TileView(tile: board.tiles[24])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 25)
                    }
                }) {
                    TileView(tile: board.tiles[25])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 26)
                    }
                }) {
                    TileView(tile: board.tiles[26])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 27)
                    }
                }) {
                    TileView(tile: board.tiles[27])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 28)
                    }
                }) {
                    TileView(tile: board.tiles[28])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 29)
                    }
                }) {
                    TileView(tile: board.tiles[29])
                }.disabled(board.generation > 0)
            }
            HStack(spacing: 2.0) {
                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 30)
                    }
                }) {
                    TileView(tile: board.tiles[30])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 31)
                    }
                }) {
                    TileView(tile: board.tiles[31])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 32)
                    }
                }) {
                    TileView(tile: board.tiles[32])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 33)
                    }
                }) {
                    TileView(tile: board.tiles[33])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 34)
                    }
                }) {
                    TileView(tile: board.tiles[34])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 35)
                    }
                }) {
                    TileView(tile: board.tiles[35])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 36)
                    }
                }) {
                    TileView(tile: board.tiles[36])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 37)
                    }
                }) {
                    TileView(tile: board.tiles[37])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 38)
                    }
                }) {
                    TileView(tile: board.tiles[38])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 39)
                    }
                }) {
                    TileView(tile: board.tiles[39])
                }.disabled(board.generation > 0)
            }
            HStack(spacing: 2.0) {
                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 40)
                    }
                }) {
                    TileView(tile: board.tiles[40])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 41)
                    }
                }) {
                    TileView(tile: board.tiles[41])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 42)
                    }
                }) {
                    TileView(tile: board.tiles[42])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 43)
                    }
                }) {
                    TileView(tile: board.tiles[43])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 44)
                    }
                }) {
                    TileView(tile: board.tiles[44])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 45)
                    }
                }) {
                    TileView(tile: board.tiles[45])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 46)
                    }
                }) {
                    TileView(tile: board.tiles[46])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 47)
                    }
                }) {
                    TileView(tile: board.tiles[47])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 48)
                    }
                }) {
                    TileView(tile: board.tiles[48])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 49)
                    }
                }) {
                    TileView(tile: board.tiles[49])
                }.disabled(board.generation > 0)
            }
            HStack(spacing: 2.0) {
                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 50)
                    }
                }) {
                    TileView(tile: board.tiles[50])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 51)
                    }
                }) {
                    TileView(tile: board.tiles[51])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 52)
                    }
                }) {
                    TileView(tile: board.tiles[52])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 53)
                    }
                }) {
                    TileView(tile: board.tiles[53])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 54)
                    }
                }) {
                    TileView(tile: board.tiles[54])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 55)
                    }
                }) {
                    TileView(tile: board.tiles[55])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 56)
                    }
                }) {
                    TileView(tile: board.tiles[56])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 57)
                    }
                }) {
                    TileView(tile: board.tiles[57])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 58)
                    }
                }) {
                    TileView(tile: board.tiles[58])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 59)
                    }
                }) {
                    TileView(tile: board.tiles[59])
                }.disabled(board.generation > 0)
            }
            HStack(spacing: 2.0) {
                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 60)
                    }
                }) {
                    TileView(tile: board.tiles[60])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 61)
                    }
                }) {
                    TileView(tile: board.tiles[61])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 62)
                    }
                }) {
                    TileView(tile: board.tiles[62])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 63)
                    }
                }) {
                    TileView(tile: board.tiles[63])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 64)
                    }
                }) {
                    TileView(tile: board.tiles[64])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 65)
                    }
                }) {
                    TileView(tile: board.tiles[65])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 66)
                    }
                }) {
                    TileView(tile: board.tiles[66])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 67)
                    }
                }) {
                    TileView(tile: board.tiles[67])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 68)
                    }
                }) {
                    TileView(tile: board.tiles[68])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 69)
                    }
                }) {
                    TileView(tile: board.tiles[69])
                }.disabled(board.generation > 0)
            }
            HStack(spacing: 2.0) {
                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 70)
                    }
                }) {
                    TileView(tile: board.tiles[70])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 71)
                    }
                }) {
                    TileView(tile: board.tiles[71])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 72)
                    }
                }) {
                    TileView(tile: board.tiles[72])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 73)
                    }
                }) {
                    TileView(tile: board.tiles[73])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 74)
                    }
                }) {
                    TileView(tile: board.tiles[74])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 75)
                    }
                }) {
                    TileView(tile: board.tiles[75])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 76)
                    }
                }) {
                    TileView(tile: board.tiles[76])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 77)
                    }
                }) {
                    TileView(tile: board.tiles[77])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 78)
                    }
                }) {
                    TileView(tile: board.tiles[78])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 79)
                    }
                }) {
                    TileView(tile: board.tiles[79])
                }.disabled(board.generation > 0)
            }
            HStack(spacing: 2.0) {
                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 80)
                    }
                }) {
                    TileView(tile: board.tiles[80])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 81)
                    }
                }) {
                    TileView(tile: board.tiles[81])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 82)
                    }
                }) {
                    TileView(tile: board.tiles[82])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 83)
                    }
                }) {
                    TileView(tile: board.tiles[83])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 84)
                    }
                }) {
                    TileView(tile: board.tiles[84])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 85)
                    }
                }) {
                    TileView(tile: board.tiles[85])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 86)
                    }
                }) {
                    TileView(tile: board.tiles[86])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 87)
                    }
                }) {
                    TileView(tile: board.tiles[87])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 88)
                    }
                }) {
                    TileView(tile: board.tiles[88])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 89)
                    }
                }) {
                    TileView(tile: board.tiles[89])
                }.disabled(board.generation > 0)
            }
            HStack(spacing: 2.0) {
                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 90)
                    }
                }) {
                    TileView(tile: board.tiles[90])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 91)
                    }
                }) {
                    TileView(tile: board.tiles[91])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 92)
                    }
                }) {
                    TileView(tile: board.tiles[92])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 93)
                    }
                }) {
                    TileView(tile: board.tiles[93])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 94)
                    }
                }) {
                    TileView(tile: board.tiles[94])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 95)
                    }
                }) {
                    TileView(tile: board.tiles[95])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 96)
                    }
                }) {
                    TileView(tile: board.tiles[96])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 97)
                    }
                }) {
                    TileView(tile: board.tiles[97])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 98)
                    }
                }) {
                    TileView(tile: board.tiles[98])
                }.disabled(board.generation > 0)

                Button(action: {
                    withAnimation {
                        self.board.toggleTile(identifier: 99)
                    }
                }) {
                    TileView(tile: board.tiles[99])
                }.disabled(board.generation > 0)
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(board: Board(squareLength: 10, withRandomState: true))
    }
}
