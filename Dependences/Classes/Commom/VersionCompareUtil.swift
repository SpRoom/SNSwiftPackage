

func version(compare local: String, remote: String) -> Bool {
    let localArr = local.components(separatedBy: ".").filter { !$0.isEmpty }
    let remoteArr = remote.components(separatedBy: ".").filter { !$0.isEmpty }
    
    let unit = min(localArr.count, remoteArr.count)
    
    for i in 0..<unit {
        let lv = localArr[i]
        let rv = remoteArr[i]
        guard let lvInt = Int(lv) else { return false }
        guard let rvInt = Int(rv) else { return false }
        if lvInt == rvInt {
            continue
        } else if lvInt > rvInt {
            return false
        } else if lvInt < rvInt {
            return true
        }
    }
    
    if localArr.count < remoteArr.count {
        return true
    } else {
        return false
    }
}