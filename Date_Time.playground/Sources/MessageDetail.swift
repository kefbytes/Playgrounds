import Foundation

public struct MessageDetail: Codable {
    public let messageType: String
    public let messageId: String
    public let messageDate: String
    public let messageBody: String?
    public let messageToNumber: String?
    public let messageToName: String?
    public let messageFromNumber: String?
    public let messageFromName: String?
    public let messageIsRead: Bool?
    public let messageStatus: String?
    public let timezone: String?
    public let statusTime: String?
    public let clientID: String?
    
    public enum CodingKeys: String, CodingKey {
        case messageType = "messageType"
        case messageId = "messageId"
        case messageDate = "messageDate"
        case messageBody = "messageBody"
        case messageToNumber = "messageToNumber"
        case messageToName = "messageToName"
        case messageFromNumber = "messageFromNumber"
        case messageFromName = "messageFromName"
        case messageIsRead = "messageIsRead"
        case messageStatus = "messageStatus"
        case timezone = "timezone"
        case statusTime = "statustime"
        case clientID = "clientid"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        messageType = try container.decode(String.self, forKey: .messageType)
        messageId = try container.decode(String.self, forKey: .messageId)
        messageBody = try container.decode(String.self, forKey: .messageBody)
        messageDate = try container.decode(String.self, forKey: .messageDate)
        messageToNumber = try container.decode(String.self, forKey: .messageToNumber)
        messageToName = try container.decode(String.self, forKey: .messageToName)
        messageFromNumber = try container.decode(String.self, forKey: .messageFromNumber)
        messageFromName = try container.decode(String.self, forKey: .messageFromName)
        messageIsRead = try container.decode(Bool.self, forKey: .messageIsRead)
        messageStatus = try container.decode(String.self, forKey: .messageStatus)
        timezone = try container.decode(String.self, forKey: .timezone)
        statusTime = try container.decode(String.self, forKey: .statusTime)
        clientID = try container.decode(String.self, forKey: .clientID)
    }
    
}
