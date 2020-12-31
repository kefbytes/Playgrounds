import Foundation

public struct ShipmentItemDTO: Decodable {
    // swiftlint:disable:next identifier_name
    let id: Double?
    let shipmentId: Double?
    let orderLineItemId: Double?
    let quantityShipped: Double?
    let isShipped: Bool?
    let companyCarrier: CompanyCarrierDTO?
    let trackingNumber: String?
    let customsValue: Double?
    let estimatedDeliveryDate: String?
    let productId: Double?
    let productSku: String?
    let productName: String?
    let isConfirmed: Bool?

    enum CodingKeys: String, CodingKey {
        // swiftlint:disable:next identifier_name
        case id = "Id"
        case shipmentId = "ShipmentId"
        case orderLineItemId = "OrderLineItemId"
        case quantityShipped = "QuantityShipped"
        case isShipped = "IsShipped"
        case companyCarrier = "CompanyCarrier"
        case trackingNumber = "TrackingNumber"
        case customsValue = "CustomsValue"
        case estimatedDeliveryDate = "EstimatedDeliveryDate"
        case productId = "ProductId"
        case productSku = "ProductSku"
        case productName = "ProductName"
        case isConfirmed = "IsConfirmed"
    }

}

struct CompanyCarrierDTO: Decodable {
    // swiftlint:disable:next identifier_name
    let id: Double?
    let name: String?

    enum CodingKeys: String, CodingKey {
        // swiftlint:disable:next identifier_name
        case id = "Id"
        case name = "Name"
    }
}
