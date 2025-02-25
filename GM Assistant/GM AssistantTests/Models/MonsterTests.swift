import Foundation
import Testing
@testable import GM_Assistant

struct MonsterTests {
    @Test("Monster decoding")
    func decodeMonster() throws {
        // given
        let decoder = JSONDecoder()

        // when
        let monster = try decoder.decode(
            Monster.self,
            from: sampleMonster_goblin
        )

        // then
        #expect(monster.id == "goblin")
        #expect(monster.name == "Goblin")
        #expect(monster.hitPointsSpec == "2d6")
    }
}
