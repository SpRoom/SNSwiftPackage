//
//  Float+FileSize.swift
//  zshSeedOne
//
//  Created by ios-spec on 2019/1/26.
//  Copyright © 2019 zsh. All rights reserved.
//

import Foundation

extension Float {

    var bitToBytes: Float {
        return self * 8
    }

    var bitToKB: Float {
        return self.bitToBytes.multi1024
    }

    var bitToMB: Float {
        return self.bitToKB.multi1024
    }

    var bitToGB: Float {
        return self.bitToMB.multi1024
    }

    var bitToTB: Float {
        return self.bitToGB.multi1024
    }

    var bytesToBit: Float {
        return self / 8
    }

    var bytesToKB: Float {
        return self.multi1024
    }

    var bytesToMB: Float {
        return self.bytesToKB.multi1024
    }

    var bytesToGB: Float {
        return self.bytesToMB.multi1024
    }

    var bytesToTB: Float {
        return self.bytesToGB.multi1024
    }

    var kBToBytes: Float {
        return self.divid1024
    }

    var kBToBit: Float {
        return self.kBToBytes.bytesToBit
    }

    var kBToMB: Float {
        return self.multi1024
    }

    var kBToGB: Float {
        return self.kBToMB.multi1024
    }

    var kBToTB: Float {
        return self.kBToGB.multi1024
    }

    var mBToKB: Float {
        return self.divid1024
    }

    var mBToBytes: Float {
        return self.mBToKB.kBToBytes
    }

    var mBToBit: Float {
        return self.mBToKB.kBToBit
    }

    var mBToGB: Float {
        return self.multi1024
    }

    var mBToTB: Float {
        return self.mBToGB.multi1024
    }

    var gBToTB: Float {
        return self.multi1024
    }

    var gBToMB: Float {
        return self.divid1024
    }

    var gBToKB: Float {
        return self.gBToMB.mBToKB
    }

    var gBToBytes: Float {
        return self.gBToMB.mBToBytes
    }

    var gBToBit: Float {
        return self.gBToMB.mBToBit
    }

    var tBToGB: Float {
        return self.divid1024
    }

    var tBToMB: Float {
        return self.tBToGB.gBToMB
    }

    var tBToKB: Float {
        return self.tBToGB.gBToKB
    }

    var tBToBytes: Float {
        return self.tBToGB.gBToBytes
    }

    var tBToBit: Float {
        return self.tBToGB.gBToBit
    }

    var divid1024: Float {
        return self / 1024
    }

    var multi1024: Float {
        return self * 1024
    }
}
