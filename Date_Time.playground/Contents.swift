//: Playground - noun: a place where people can play

import UIKit
import Foundation

let date1String = "2018-08-31T13:56:55.797"
let date2String = "2018-08-31T14:07:32.02"

//func formatToFriendlyDateString(dateIn: String) -> String {
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.zz"
//    dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
//    if let date = dateFormatter.date(from: dateIn) {
//        print("🤖 formatToFriendlyDateString date = \(date)")
//        return ""
//    } else {
//        return ""
//    }
//}

//print(formatToFriendlyDateString(dateIn: date1String))
print("test")

//func areTheseDatesWithIn15Minutes(date1String: String, date2String: String) -> Bool{
//    var sameConversation = true
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.zz"
//    dateFormatter.timeZone = TimeZone(abbreviation: "PDT")
//    let date1 = dateFormatter.date(from: date1String)
//    let date2 = dateFormatter.date(from: date2String)
//    let difference = Calendar.current.dateComponents([.hour, .minute], from: date1!, to: date2!)
//    if difference.hour! < 1 && difference.minute! < 16 {
//        sameConversation = true
//    } else {
//        sameConversation = false
//    }
//    return sameConversation
//}
//
//areTheseDatesWithIn15Minutes(date1String: date1String, date2String: date2String)
//
//// Simply getting the file path to the local json file
//guard let filePath = Bundle.main.path(forResource: "fetchChatDetailsResponse", ofType: "json") else {
//    assert(false, "❌ Bad file path. file_name.json does not exist.")
//}
//
//// Read in the local json file
//guard let jsonData = FileManager.default.contents(atPath: filePath) else {
//    assert(false, "❌ Unable to get contents of file")
//}
//
//var conversationArray:[MessageDetail] = [MessageDetail]()
//var fullChatHistoryArray:[[MessageDetail]] = [[MessageDetail]]()
//
//func buildChatHistoryArray(flatChatArray: [MessageDetail]) {
//    var conversationTime = ""
//    for (index, message) in flatChatArray.enumerated() {
//        if index == 0 || index == 1 {
//            conversationArray.append(message)
//            conversationTime = message.messageDate
//            continue
//        } else {
//            if areTheseDatesWithIn15Minutes(date1String: conversationTime, date2String: message.messageDate) {
//                conversationArray.append(message)
//            } else {
//                fullChatHistoryArray.append(conversationArray)
//                conversationArray.removeAll()
//            }
//        }
//        conversationTime = message.messageDate
//    }
//}
//
//do {
//    let response = try JSONDecoder().decode(ServiceResponseCodable.self, from: jsonData)
//    var fullMessagesUnflattened:[[MessageDetail]] = [[MessageDetail]]()
//    if let chatDetails = response.data {
//        for chat in chatDetails {
//            fullMessagesUnflattened.append(chat.message!)
//        }
//        let flatArrayOfMessages = fullMessagesUnflattened.flatMap{ $0 }
//        buildChatHistoryArray(flatChatArray: flatArrayOfMessages)
//    }
//} catch {
//    print(error.localizedDescription)
//}
//
//for conversation in fullChatHistoryArray {
//    print("-------------- \(conversation[0].messageDate) --------------")
//    for message in conversation {
//        print("\(message.messageBody)")
//    }
//}


