//
//  Shape.swift
//  Steel Beam Size Finder
//
//  Created by Nathaniel Law on 2/24/23.
//

import UIKit

struct Shape {
    let type: String
    let AISC_Manual_Label: String
    var matchPercentage: Float
    let W: Float
    let A: Float
    let d: Float
    var dPercentage: Float
    let bf: Float
    var bfPercentage: Float
    let tw: Float
    var twPercentage: Float
    let tf: Float
    var tfPercentage: Float
    let b_t: Float
    let h_tw: Float
    let Ix: Float
    let Zx: Float
    let Sx: Float
    let rx: Float
    let Iy: Float
    let Zy: Float
    let Sy: Float
    let ry: Float
    let Iz: Float
    let rz: Float
    let Sz: Float
    let J: Float
    
    init(raw:[String]) {
        self.type = raw[0]
        self.AISC_Manual_Label = raw[1]
        self.matchPercentage = 0
        self.W = Float(raw[2]) ?? 0
        self.A = Float(raw[3]) ?? 0
        self.d = Float(raw[4]) ?? 0
        self.dPercentage = 0
        self.bf = Float(raw[5]) ?? 0
        self.bfPercentage = 0
        self.tw = Float(raw[6]) ?? 0
        self.twPercentage = 0
        self.tf = Float(raw[7]) ?? 0
        self.tfPercentage = 0
        self.b_t = Float(raw[8]) ?? 0
        self.h_tw = Float(raw[9]) ?? 0
        self.Ix = Float(raw[10]) ?? 0
        self.Zx = Float(raw[11]) ?? 0
        self.Sx = Float(raw[12]) ?? 0
        self.rx = Float(raw[13]) ?? 0
        self.Iy = Float(raw[14]) ?? 0
        self.Zy = Float(raw[15]) ?? 0
        self.Sy = Float(raw[16]) ?? 0
        self.ry = Float(raw[17]) ?? 0
        self.Iz = Float(raw[18]) ?? 0
        self.rz = Float(raw[19]) ?? 0
        self.Sz = Float(raw[20]) ?? 0
        self.J = Float(raw[21]) ?? 0
    }
}
