//
//  HandleCSV.swift
//  Steel Beam Size Finder
//
//  Created by Nathaniel Law on 2/25/23.
//

import Foundation

func loadCSVData() -> [Shape] {
    var csvToStruct = [Shape]()
    
    // Locate the CSV file
    guard let filePath = Bundle.main.path(forResource: "Database v15.0-Table_Cleaned", ofType: "csv") else {
        print("Error: File Not Found.")
        return []
    }
    
    // Convert the contents of the array
    var data = ""
    do {
        data = try String(contentsOfFile: filePath)
    } catch {
        print(error)
        return []
    }
    
    // Split the long string containing all the shapes into individual rows of strings
    var rows = data.components(separatedBy: "\n")
    
    // Remove the header
    rows.removeFirst()
    
    // Loop through the data string and split each row into columns
    for row in rows {
        let csvColumns = row.components(separatedBy: ",")
        if csvColumns.count == rows.first?.components(separatedBy: ",").count {
            let linesStruct = Shape.init(raw: csvColumns)
            csvToStruct.append(linesStruct)
        }
    }
    
    return csvToStruct
}

