import Foundation

public struct ChatDetails: Decodable {
    
    public let date: String?
    public let messageCount: String?
    public let message: [MessageDetail]?
    
    public enum CodingKeys: String, CodingKey {
        case date = "Date"
        case messageCount = "messageCount"
        case message = "Message"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        date = try container.decode(String.self, forKey: .date)
        messageCount = try container.decode(String.self, forKey: .messageCount)
        message = try container.decode([MessageDetail].self, forKey: .message)
    }
}
