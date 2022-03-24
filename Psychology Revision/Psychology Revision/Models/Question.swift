
struct Question: Codable {
    let question: String
    let answers: [String]
    let marks: Int
    let correctAnswerIndex: Int
}
