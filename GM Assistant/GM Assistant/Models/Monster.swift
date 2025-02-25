import Foundation

struct Monster: Identifiable {
    let id: String
    let name: String
    let hitPointsSpec: String
}

extension Monster: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id = "index"
        case name
        case hitPointsSpec = "hit_points_roll"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        let rawId = try? values.decode(String.self, forKey: .id)
        let rawName = try? values.decode(String.self, forKey: .name)
        let rawHitPointsSpec = try? values.decode(
            String.self,
            forKey: .hitPointsSpec
        )

        guard let id = rawId,
              let name = rawName,
              let hitPointsSpec = rawHitPointsSpec
        else {
            throw MonsterError.missingData
        }

        self.id = id
        self.name = name
        self.hitPointsSpec = hitPointsSpec
    }
}
