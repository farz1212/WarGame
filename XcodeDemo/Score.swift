//
//  Score.swift
//  XcodeDemo
//
//  Created by Farzaad Goiporia on 2023-10-24.
//

import Foundation
import SwiftData 

@Model
class Score: Identifiable{
    
    var playerScore: Int
    var cpuScore: Int
    
    init(playerScore: Int, cpuScore: Int) {
        self.playerScore = playerScore
        self.cpuScore = cpuScore
    }
}
