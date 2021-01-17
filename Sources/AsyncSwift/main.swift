import Foundation

func backgroundWork() async -> [Int] {
    var collection = [Int]()
    for _ in 0..<10 {
        collection.append(Int.random(in: 1...100))
        Thread.sleep(forTimeInterval: 0.5)
    }
    return collection
}

// Allows a func to invoke an async func from within a synchronous context
@asyncHandler
func main() {
    print("Starting background work...")
    async let result = backgroundWork()
    
    print("Doing something else in the meantime...")
    for i in 0...10 {
        print(Int.random(in: 1...100), terminator: i == 10 ? "\n" : ", ")
    }
    
    print(await result)
}

main()
sleep(10)
