import UIKit

guard let filePath = Bundle.main.path(forResource: "item", ofType: "json") else {
    assert(false, "❌ Bad file path. Questions.json does not exist.")
}
guard let jsonData = FileManager.default.contents(atPath: filePath) else {
    assert(false, "❌ Unable to get contents of file")
}

do {
    print(String(data: jsonData, encoding: String.Encoding.utf8)!)
    let model = try JSONDecoder().decode(ShipmentItemDTO.self, from: jsonData)
    print("model: \(model)")
} catch {
    print("❌ \(error.localizedDescription)")
}
