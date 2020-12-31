import UIKit

func formatDate(fromString dateString: String) -> String {
    var dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = dateFormat
    let dateDate = dateFormatter.date(from: dateString)
    dateFormat = "MM-dd-yyyy"
    dateFormatter.dateFormat = dateFormat
    guard let date = dateDate else {
       return ""
    }
    return dateFormatter.string(from: date)
}


print("formated date: \(formatDate(fromString: "2020-02-02T22:23:13+0000"))")


