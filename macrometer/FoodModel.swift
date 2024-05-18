import Foundation
import GRDB

struct Food: Codable, FetchableRecord, PersistableRecord, TableRecord {

    static let databaseTableName = "allNutrients"

    var foodKey: String
    var name: String
    var energy: Int
    var protein: Double
    var fat: Double
    var carbohydrate: Double
    var sugars: Double
    var sodium: Int

}

@Observable
final class FoodModel {

    var foods: [Food] {
        allFoods.filter { food in
            guard searchText.isEmpty == false else {
                return true
            }

            return food.name.contains(searchText)
        }
    }

    var searchText = ""

    private var allFoods: [Food]

    init() {
        let path = Bundle.main.path(forResource: "food", ofType: "db")!

        let dbQueue = try! DatabaseQueue(path: path)

        allFoods = try! dbQueue.read { db in
    		try! Food.fetchAll(db)
        }
    }
    
}
