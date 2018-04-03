import Foundation

public protocol DataGenerator {
    func getStudents() -> [PersonType]
    func getBusinessCard(for studentID: Int) -> BusinessCard
}

public class MockDataProvider: DataGenerator {
    
    static let shared = MockDataProvider()

    private static let students = [
        Person(id: 1, name: "Adam", icon: "adam", scores: [
            Score(title: "🐗", value: Int(arc4random_uniform(30))),
            Score(title: "🍔", value: Int(arc4random_uniform(30))),
            Score(title: "🍕", value: Int(arc4random_uniform(30))),
            Score(title: "🌮", value: Int(arc4random_uniform(30)))
            ]),
        Person(id: 2, name: "Dorota", icon: "dorota", scores: [
            Score(title: "🐗", value: Int(arc4random_uniform(30))),
            Score(title: "🍔", value: Int(arc4random_uniform(30))),
            Score(title: "🍕", value: Int(arc4random_uniform(30))),
            Score(title: "🌮", value: Int(arc4random_uniform(30)))
            ]),
        Person(id: 3, name: "Jan", icon: "jan-kodes", scores: [
            Score(title: "🐗", value: Int(arc4random_uniform(30))),
            Score(title: "🍔", value: Int(arc4random_uniform(30))),
            Score(title: "🍕", value: Int(arc4random_uniform(30))),
            Score(title: "🌮", value: Int(arc4random_uniform(30)))
            ]),
        Person(id: 4, name: "Jan", icon: "jan-svehla", scores: [
            Score(title: "🐗", value: Int(arc4random_uniform(30))),
            Score(title: "🍔", value: Int(arc4random_uniform(30))),
            Score(title: "🍕", value: Int(arc4random_uniform(30))),
            Score(title: "🌮", value: Int(arc4random_uniform(30)))
            ]),
        Person(id: 5, name: "Lukáš", icon: "lukas", scores: [
            Score(title: "🐗", value: Int(arc4random_uniform(30))),
            Score(title: "🍔", value: Int(arc4random_uniform(30))),
            Score(title: "🍕", value: Int(arc4random_uniform(30))),
            Score(title: "🌮", value: Int(arc4random_uniform(30)))
            ]),
        Person(id: 6, name: "Marek", icon: "marek", scores: [
            Score(title: "🐗", value: Int(arc4random_uniform(30))),
            Score(title: "🍔", value: Int(arc4random_uniform(30))),
            Score(title: "🍕", value: Int(arc4random_uniform(30))),
            Score(title: "🌮", value: Int(arc4random_uniform(30)))
            ]),
        Person(id: 7, name: "Martina", icon: "martina", scores: [
            Score(title: "🐗", value: Int(arc4random_uniform(30))),
            Score(title: "🍔", value: Int(arc4random_uniform(30))),
            Score(title: "🍕", value: Int(arc4random_uniform(30))),
            Score(title: "🌮", value: Int(arc4random_uniform(30)))
            ]),
        Person(id: 8, name: "MichalC", icon: "michal-cambor", scores: [
            Score(title: "🐗", value: Int(arc4random_uniform(30))),
            Score(title: "🍔", value: Int(arc4random_uniform(30))),
            Score(title: "🍕", value: Int(arc4random_uniform(30))),
            Score(title: "🌮", value: Int(arc4random_uniform(30)))
            ]),
        Person(id: 9, name: "Majk", icon: "majk", scores: [
            Score(title: "🐗", value: Int(arc4random_uniform(30))),
            Score(title: "🍔", value: Int(arc4random_uniform(30))),
            Score(title: "🍕", value: Int(arc4random_uniform(30))),
            Score(title: "🌮", value: Int(arc4random_uniform(30)))
            ]),
        Person(id: 10, name: "MichalK", icon: "michal-kroupa", scores: [
            Score(title: "🐗", value: Int(arc4random_uniform(30))),
            Score(title: "🍔", value: Int(arc4random_uniform(30))),
            Score(title: "🍕", value: Int(arc4random_uniform(30))),
            Score(title: "🌮", value: Int(arc4random_uniform(30)))
            ]),
        Person(id: 11, name: "Milan", icon: "milan", scores: [
            Score(title: "🐗", value: Int(arc4random_uniform(30))),
            Score(title: "🍔", value: Int(arc4random_uniform(30))),
            Score(title: "🍕", value: Int(arc4random_uniform(30))),
            Score(title: "🌮", value: Int(arc4random_uniform(30)))
            ]),
        Person(id: 12, name: "Seb", icon: "seb", scores: [
            Score(title: "🐗", value: Int(arc4random_uniform(30))),
            Score(title: "🍔", value: Int(arc4random_uniform(30))),
            Score(title: "🍕", value: Int(arc4random_uniform(30))),
            Score(title: "🌮", value: Int(arc4random_uniform(30)))
            ]),
        Person(id: 13, name: "Šimon", icon: "simon", scores: [
            Score(title: "🐗", value: Int(arc4random_uniform(30))),
            Score(title: "🍔", value: Int(arc4random_uniform(30))),
            Score(title: "🍕", value: Int(arc4random_uniform(30))),
            Score(title: "🌮", value: Int(arc4random_uniform(30)))
            ]),
        Person(id: 14, name: "Tuan", icon: "tuan", scores: [
            Score(title: "🐗", value: Int(arc4random_uniform(30))),
            Score(title: "🍔", value: Int(arc4random_uniform(30))),
            Score(title: "🍕", value: Int(arc4random_uniform(30))),
            Score(title: "🌮", value: Int(arc4random_uniform(30)))
            ])
    ]
    
    public func getBusinessCard(for studentId: Int) -> BusinessCard {
        let students = getStudents()[studentId - 1]
        let namedScores = students.scores.map { (emojiScore: ScoreType) -> ScoreType in
            switch emojiScore.title {
            case "🐗":
                return Score(title: "Divočákové skóre", value: emojiScore.value)
            case "🍔":
                return Score(title: "Burger skóre", value: emojiScore.value)
            case "🍕":
                return Score(title: "Pizza skóre", value: emojiScore.value)
            case "🌮":
                return Score(title: "Taco skóre", value: emojiScore.value)
            default:
                return Score(title: "Neznámé skóre", value: emojiScore.value)
            }
            }
        let content = BusinessCard(photoName: "\(students.icon)-large", name: students.name, slackUserId: "1234", email: "email", phone: "724123321", position: "Swift ninja junior", scores: namedScores)
        return content
    }
    
    public func getStudents() -> [PersonType] {
        return MockDataProvider.students
    }
}

extension Array {
    mutating func shuffle() {
        var temp = [Element]()
        for _  in self {
            let random = arc4random_uniform(UInt32(self.count))
            let elementTaken = self[Int(random)]
            temp.append(elementTaken)
            self.remove(at: Int(random))
        }
        self = temp
    }
}
