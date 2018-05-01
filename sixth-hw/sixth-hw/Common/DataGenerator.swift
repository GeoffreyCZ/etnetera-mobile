import Foundation

public protocol DataGenerator {
    func getStudents() -> [Person]
    func getBusinessCard(for studentID: Int) -> BusinessCard
}

public class MockDataProvider: DataGenerator {
    
    static let shared = MockDataProvider()

    private static let students = [
        Person(id: 1, name: "Adam", icon: "adam", scores: [
            Score(value: Int(arc4random_uniform(30)), emoji: "🐗"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🍔"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🍕"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🌮")
            ]),
        Person(id: 2, name: "Dorota", icon: "dorota", scores: [
            Score(value: Int(arc4random_uniform(30)), emoji: "🐗"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🍔"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🍕"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🌮")
            ]),
        Person(id: 3, name: "Jan", icon: "jan-kodes", scores: [
            Score(value: Int(arc4random_uniform(30)), emoji: "🐗"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🍔"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🍕"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🌮")
            ]),
        Person(id: 4, name: "Jan", icon: "jan-svehla", scores: [
            Score(value: Int(arc4random_uniform(30)), emoji: "🐗"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🍔"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🍕"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🌮")
            ]),
        Person(id: 5, name: "Lukáš", icon: "lukas", scores: [
            Score(value: Int(arc4random_uniform(30)), emoji: "🐗"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🍔"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🍕"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🌮")
            ]),
        Person(id: 6, name: "Marek", icon: "marek", scores: [
            Score(value: Int(arc4random_uniform(30)), emoji: "🐗"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🍔"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🍕"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🌮")
            ]),
        Person(id: 7, name: "Martina", icon: "martina", scores: [
            Score(value: Int(arc4random_uniform(30)), emoji: "🐗"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🍔"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🍕"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🌮")
            ]),
        Person(id: 8, name: "MichalC", icon: "michal-cambor", scores: [
            Score(value: Int(arc4random_uniform(30)), emoji: "🐗"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🍔"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🍕"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🌮")
            ]),
        Person(id: 9, name: "Majk", icon: "majk", scores: [
            Score(value: Int(arc4random_uniform(30)), emoji: "🐗"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🍔"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🍕"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🌮")
            ]),
        Person(id: 10, name: "MichalK", icon: "michal-kroupa", scores: [
            Score(value: Int(arc4random_uniform(30)), emoji: "🐗"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🍔"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🍕"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🌮")
            ]),
        Person(id: 11, name: "Milan", icon: "milan", scores: [
            Score(value: Int(arc4random_uniform(30)), emoji: "🐗"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🍔"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🍕"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🌮")
            ]),
        Person(id: 12, name: "Seb", icon: "seb", scores: [
            Score(value: Int(arc4random_uniform(30)), emoji: "🐗"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🍔"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🍕"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🌮")
            ]),
        Person(id: 13, name: "Šimon", icon: "simon", scores: [
            Score(value: Int(arc4random_uniform(30)), emoji: "🐗"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🍔"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🍕"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🌮")
            ]),
        Person(id: 14, name: "Tuan", icon: "tuan", scores: [
            Score(value: Int(arc4random_uniform(30)), emoji: "🐗"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🍔"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🍕"),
            Score(value: Int(arc4random_uniform(30)), emoji: "🌮")
            ])
    ]
    
    public func getBusinessCard(for studentId: Int) -> BusinessCard {
        let students = getStudents()[studentId - 1]
        let namedScores = students.scores.map { (emojiScore: Score) -> Score in
            switch emojiScore.emoji {
            case "🐗":
                return Score(value: emojiScore.value, emoji: "Divočákové skóre")
            case "🍔":
                return Score(value: emojiScore.value, emoji: "Burger skóre")
            case "🍕":
                return Score(value: emojiScore.value, emoji: "Pizza skóre")
            case "🌮":
                return Score(value: emojiScore.value, emoji: "Taco skóre")
            default:
                return Score(value: emojiScore.value, emoji: "Neznámé skóre")
            }
            }
        let content = BusinessCard(photoName: "\(students.icon)-large", name: students.name, slack_id: "1234", email: "email", phone: "724123321", position: "Swift ninja junior", scores: namedScores)
        return content
    }
    
    public func getStudents() -> [Person] {
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
