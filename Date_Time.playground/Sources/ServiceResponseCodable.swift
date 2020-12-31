import Foundation

public struct ServiceResponseCodable: Decodable {
    
    public let status: String?
    public let statusMessage: String?
    public let data: [ChatDetails]?
    
}



