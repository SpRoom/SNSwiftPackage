//
//  FileSize.swift
//  zshSeedOne
//
//  Created by ios-spec on 2019/1/26.
//  Copyright © 2019 zsh. All rights reserved.
//

import Foundation

struct FileSize {

    enum FileSizeUnit {
        case Bit
        case Bytes
        case KB
        case MB
        case GB
        case TB
    }

    var unit: FileSizeUnit = .Bytes

    var num: Float = 0

    var bitValue: Float {
        switch unit {
        case .Bit:
            return num
        case .Bytes:
            return num.bytesToBit
        case .KB:
            return num.kBToBit
        case .MB:
            return num.mBToBit
        case .GB:
            return num.gBToBit
        case .TB:
            return num.tBToBit
        }
    }

    var bytesValue: Float {
        switch unit {
        case .Bit:
            return num.bitToBytes
        case .Bytes:
            return num
        case .KB:
            return num.kBToBytes
        case .MB:
            return num.mBToBytes
        case .GB:
            return num.gBToBytes
        case .TB:
            return num.tBToBytes
        }
    }

    var kBValue: Float {
        switch unit {
        case .Bit:
            return num.bitToKB
        case .Bytes:
            return num.bytesToKB
        case .KB:
            return num
        case .MB:
            return num.mBToKB
        case .GB:
            return num.gBToKB
        case .TB:
            return num.tBToKB
        }
    }

    var mBVlaue: Float {
        switch unit {
        case .Bit:
            return num.bitToMB
        case .Bytes:
            return num.bytesToMB
        case .KB:
            return num.kBToMB
        case .MB:
            return num
        case .GB:
            return num.gBToMB
        case .TB:
            return num.tBToMB
        }
    }

    var gBValue: Float {
        switch unit {
        case .Bit:
            return num.bitToGB
        case .Bytes:
            return num.bytesToGB
        case .KB:
            return num.kBToGB
        case .MB:
            return num.mBToGB
        case .GB:
            return num
        case .TB:
            return num.tBToGB
        }
    }

    var tBVlaue: Float {
        switch unit {
        case .Bit:
            return num.bitToTB
        case .Bytes:
            return num.bytesToTB
        case .KB:
            return num.kBToTB
        case .MB:
            return num.mBToTB
        case .GB:
            return num.gBToTB
        case .TB:
            return num
        }
    }


}
