import Foundation

final class ScaleStepsBlacklist {

    // MARK: - Public Properties

    static let shared = ScaleStepsBlacklist()

    var blacklistCount: Int {
        steps.count
    }

    // MARK: - Private Properties

    private var steps: [[ScaleStep]] = []

    // MARK: - Private Init

    private init() {
        load()
    }

    // MARK: - Public Methods

    func contains(_ steps: [ScaleStep]) -> Bool {
        self.steps.contains(steps)
    }

    func add(_ steps: [ScaleStep]) {
        self.steps.append(steps)

        let filteredSteps = Set(self.steps)
        self.steps = Array(filteredSteps)

        save()
    }

}

// MARK: - Private Methods

private extension ScaleStepsBlacklist {

    func save() {
        print("saving")

        guard let encodedData = try? JSONEncoder().encode(steps) else { print("can't encode data"); return }
        UserDefaults.standard.set(encodedData, forKey: Self.stepsKey)

        print("saved")
    }

    func load() {
        print("loading")

        guard let rawData = UserDefaults.standard.data(forKey: Self.stepsKey) else { print("can't fetch data"); return }

        guard let decodedData = try? JSONDecoder().decode([[ScaleStep]].self, from: rawData) else { print("can't decode data"); return }

        let filteredSteps = Set(decodedData)
        steps = Array(filteredSteps)

        print("loaded as much as: \(steps.count) steps")
    }

}

// MARK: - Constants

private extension ScaleStepsBlacklist {

    static let stepsKey = "steps"

}
