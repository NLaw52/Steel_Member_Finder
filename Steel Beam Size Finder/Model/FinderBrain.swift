//
//  FinderBrain.swift
//  Steel Beam Size Finder
//
//  Created by Nathaniel Law on 2/24/23.
//

import UIKit

struct FinderBrain {
    
    // Do not need to make the "matches" array an optional because we will always return sizes even if they are low percentage matches
    var matches = [Shape]()
    var sortedTopMatches = [Shape]()
    
    // Use a mutating function so it can modify the "matches" array
    mutating func findSizes(d: Float, b: Float, tf: Float, tw: Float) {
        
        // Perform calculations to find closest AISC size matches
        // Load the tableview and cells
        let data = loadCSVData()
//        print(sampleData[0].type)
//        print(sampleData.count)
        
        let selectedShape = getSelectedShape()
//        print(selectedShape)
        
        // Set the standard deviation range to give corresponding matches
        let dStdDev: Float = 0.15              // Give a smaller range because easier to measure and order of magnitude on inches
        let bStdDev: Float = 0.15              // Give a smaller range because easier to measure and order of magnitude on inches
        let tfStdDev: Float = 0.5              // Give a larger range because order of magnitude can be less than an inch
        let twStdDev: Float = 0.5              // Give a larger range because order of magnitude can be less than an inch
        
        // Set weights of each measure to the overall match value (only affects the overall match percentage of the size match)
        let dWeight: Float = 1
        let bWeight: Float = 1
        let tfWeight: Float = 1
        let twWeight: Float = 1
        
        for var row in data {       // Use "for var" to allow mutability for the row
            if row.type == selectedShape {
                if Float(row.d) <= (d * (1 + dStdDev)) && Float(row.d) >= (d / (1 + dStdDev)) {
                    if Float(row.bf) <= (b * (1 + bStdDev)) && Float(row.bf) >= (b / (1 + bStdDev)) {
                        if Float(row.tf) <= (tf * (1 + tfStdDev)) && Float(row.tf) >= (tf / (1 + tfStdDev)) {
                            if Float(row.tw) <= (tw * (1 + twStdDev)) && Float(row.tw) >= (tw / (1 + twStdDev)) {
                                
                                // Calculate percentage matches of each of the 4 measures including the weights of each measure and average them to return an overall match value
                                row.dPercentage = calcPerMatch(user: d, AISC: row.d) * 100
                                row.bfPercentage = calcPerMatch(user: b, AISC: row.bf) * 100
                                row.tfPercentage = calcPerMatch(user: tf, AISC: row.tf) * 100
                                row.twPercentage = calcPerMatch(user: tw, AISC: row.tw) * 100
                                
                                let dWeighted = row.dPercentage * dWeight
                                let bWeighted = row.bfPercentage * bWeight
                                let tfWeighted = row.tfPercentage * tfWeight
                                let twWeighted = row.twPercentage * twWeight
                                
                                row.matchPercentage = (dWeighted + bWeighted + tfWeighted + twWeighted) / 4
                                matches.append(row)
                            }
                        }
                    }
                }
            }
        }
        // Sort the matches and only return a max of 10 top matches
        sortedTopMatches = matches.sorted(by: {$0.matchPercentage > $1.matchPercentage})
    }
    
    // Calculate the percent match of the member
    func calcPerMatch(user: Float, AISC: Float) -> Float {
        let perMatch = 1 - (abs(AISC - user) / user)
        return perMatch
    }
    
    // Getter function to return the array of top potential member sizes
    func getMatches() -> [Shape] {
        return sortedTopMatches
    }
}
