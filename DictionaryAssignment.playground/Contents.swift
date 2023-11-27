import UIKit

var employees: [[String:String]] = [["name":"Chintan","department":"IOS","DOB":"30/10/2001","empId":"11106","bloodGroup":"A+"],["name":"saad","department":"IOS","DOB":"1/12/2002","empId":"11107","bloodGroup":"AB+"],["name":"Aditya","department":"IOS","DOB":"1/12/2002","empId":"11108","bloodGroup":"O+"],["name":"mayur","department":"IOS","DOB":"4/12/1990","empId":"106","bloodGroup":"O+"],["name":"karan","department":"IOS","DOB":"6/12/2002","empId":"11111","bloodGroup":"B+"],["name":"Niranjan","department":"Flutter","DOB":"1/10/2002","empId":"11456","bloodGroup":"A+"],["name":"Rashida","department":"IOS","DOB":"1/08/2002","empId":"11096","bloodGroup":"A+"],["name":"anush","department":"Android","DOB":"1/2/2005","empId":"1116","bloodGroup":"A+"],["name":"Suraj","department":"Android","DOB":"6/1/1980","empId":"1111","bloodGroup":"B+"],["name":"Aakash","department":"Flutter","DOB":"1/04/2002","empId":"11056","bloodGroup":"A+"],["name":"Matin","department":"React Native","DOB":"1/7/2002","empId":"10006","bloodGroup":"A+"],["name":"deepak","department":"Android","DOB":"1/6/2012","empId":"11109","bloodGroup":"A+"]]


// Sort by Name
let sortedNameDict = employees.sorted { dict1, dict2 in
    return dict1["name"] ?? "" < dict2["name"] ?? ""
}
//print(sortedNameDict)

// Sort by Dept -> [[String: String]]
let sortedDeptDict = employees.sorted { dict1, dict2 in
    return dict1["department"] ?? "" < dict2["department"] ?? ""
}
//print(sortedDeptDict)

// Search Emp ID based on Name
let filteredEmps = employees.filter { dict in
    return dict["name"] == "Chintan"
}
let empIds = filteredEmps.map { dict in
    return dict["empId"]
}
//print(empIds)

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "dd/MM/YYYY"
// Sort by Date
let dateSortedDict = employees.sorted { dict1, dict2 in
    let date1 = dateFormatter.date(from: dict1["DOB"] ?? "")
    let date2 = dateFormatter.date(from: dict2["DOB"] ?? "")
    return date1 ?? Date() < date2 ?? Date()
}
//print(dateSortedDict)

// Find Youngest
let youngestDev = dateSortedDict.last
//print(youngestDev)

// Find Oldest
let oldestDev = dateSortedDict.first
//print(oldestDev)

// Sort Dept -> [[String]]
var deptDict : [String:[String]] = [:]
sortedNameDict.forEach { dict in
    if (deptDict[dict["department"] ?? ""] == nil){
        deptDict[dict["department"] ?? ""] = [dict["name"] ?? ""]
    } else {
        deptDict[dict["department"] ?? ""]?.append(dict["name"] ?? "")
    }
}
print(deptDict)

