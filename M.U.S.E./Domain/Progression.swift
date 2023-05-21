class Progression {

    var chords = [Chord]()

    let root: Note
    let scale: Scale
    let version: ProgressionVersion
    var scaleSteps: [ScaleStep]?

    init(root: Note, type: ScaleType, version: ProgressionVersion) {
        self.root = root
        self.version = version
        scale = Scale(root: root, type: type)

        chords = getChords()
    }

}

// MARK: - Public Methods

extension Progression {

    static func blacklistBadProgressions() {
        let stable: [ScaleStep] = [.one, .three, .five]

        var allScaleSteps: [[ScaleStep]] = []

        for first in ScaleStep.allCases.sorted() {
            for second in ScaleStep.allCases.sorted() {
                for third in ScaleStep.allCases.sorted() {
                    for fourth in ScaleStep.allCases.sorted() {

                        let steps = [first, second, third, fourth]

                        allScaleSteps.append(steps)

                        if
                            !steps.contains(.one) || !steps.contains(.five)
                            ||
                            steps[0] == steps[1] && steps[0] == steps[2]
                            ||
                            steps[0] == steps[2] && steps[0] == steps[3]
                            ||
                            steps[0] == steps[1] && steps[0] == steps[3]
                            ||
                            steps[1] == steps[2] && steps[1] == steps[3]
                            ||
                            steps[0] == steps[1] && steps[0] == steps[2] && steps[0] == steps[3]
                            ||
                            steps[0] == .two || steps[0] == .seven
                            ||
                            (!stable.contains(steps[3]) || !stable.contains(steps[0])) {
                            if !ScaleStepsBlacklist.shared.contains(steps) {
                                ScaleStepsBlacklist.shared.add(steps)
                            }
                            print("banned")
                        }

                        var resultString = ""

                        for (offset, step) in steps.enumerated() {
                            if offset == steps.count - 1 {
                                resultString.append("\(step)")
                                continue
                            }

                            resultString.append("\(step) -> ")
                        }

                        print(steps)
                    }
                }
            }
        }

        let allCasesCount = allScaleSteps.count

        print("Allowed: \(allCasesCount) - \(ScaleStepsBlacklist.shared.blacklistCount) = \(allCasesCount - ScaleStepsBlacklist.shared.blacklistCount)")
    }

}

// MARK: - Private Methods

private extension Progression {

    func getChords() -> [Chord] {
        switch version {
        case .oneTwoThreeFour: return configureOneTwoThreeFour()
        case .oneSixFourFive: return configureOneSixFourFive()
        case .oneThreeFourFive: return configureOneThreeFourFive()
        case .oneFiveFourOne: return configureOneFiveFourOne()
        case .random: return configureRandom()
        }
    }

    func configureChords(first: ScaleStep, second: ScaleStep, third: ScaleStep, fourth: ScaleStep) -> [Chord] {
        let chord1 = getSimpleChord(from: first)
        let chord2 = getSimpleChord(from: second)
        let chord3 = getSimpleChord(from: third)
        let chord4 = getSimpleChord(from: fourth)

        scaleSteps = [first, second, third, fourth]

        let chords = [chord1, chord2, chord3, chord4]

        return chords
    }

    func configureRandom() -> [Chord] {
        var first = ScaleStep.allCases.randomElement() ?? .one
        var second = ScaleStep.allCases.randomElement() ?? .one
        var third = ScaleStep.allCases.randomElement() ?? .one
        var fourth = ScaleStep.allCases.randomElement() ?? .one

        var steps: [ScaleStep] = [first, second, third, fourth]

        while
            !steps.contains(.one) || !steps.contains(.five)
            ||
            (steps[0] == steps[1] && steps[0] == steps[2])
            ||
            (steps[1] == steps[2] && steps[1] == steps[3])
        {
            if !ScaleStepsBlacklist.shared.contains(steps) {
                ScaleStepsBlacklist.shared.add(steps)
            }

            first = ScaleStep.allCases.randomElement() ?? .one
            second = ScaleStep.allCases.randomElement() ?? .one
            third = ScaleStep.allCases.randomElement() ?? .one
            fourth = ScaleStep.allCases.randomElement() ?? .one

            steps = [first, second, third, fourth]
        }

        while ScaleStepsBlacklist.shared.contains(steps) {

            while
                !steps.contains(.one) || !steps.contains(.five)
                ||
                (steps[0] == steps[1] && steps[0] == steps[2])
                ||
                (steps[1] == steps[2] && steps[1] == steps[3])
            {
                if !ScaleStepsBlacklist.shared.contains(steps) {
                    ScaleStepsBlacklist.shared.add(steps)
                }

                first = ScaleStep.allCases.randomElement() ?? .one
                second = ScaleStep.allCases.randomElement() ?? .one
                third = ScaleStep.allCases.randomElement() ?? .one
                fourth = ScaleStep.allCases.randomElement() ?? .one

                steps = [first, second, third, fourth]
            }

            first = ScaleStep.allCases.randomElement() ?? .one
            second = ScaleStep.allCases.randomElement() ?? .one
            third = ScaleStep.allCases.randomElement() ?? .one
            fourth = ScaleStep.allCases.randomElement() ?? .one

            steps = [first, second, third, fourth]
        }

        let chords = configureChords(first: first, second: second, third: third, fourth: fourth)

        return chords
    }

    func getSimpleChord(from step: ScaleStep) -> Chord {
        let note1 = scale.notes[step.rawValue]
        let note2 = scale.notes[step.rawValue + 2]
        let note3 = scale.notes[step.rawValue + 4]

        let notes = [note1, note2, note3]

        let chord = Chord(notes: notes)
        return chord
    }

    func configureOneTwoThreeFour() -> [Chord] {
        configureChords(first: .one, second: .two, third: .three, fourth: .four)
    }

    func configureOneSixFourFive() -> [Chord] {
        configureChords(first: .one, second: .six, third: .four, fourth: .five)
    }

    func configureOneThreeFourFive() -> [Chord] {
        configureChords(first: .one, second: .three, third: .four, fourth: .five)
    }

    func configureOneFiveFourOne() -> [Chord] {
        configureChords(first: .one, second: .five, third: .four, fourth: .one)
    }

}

// MARK: - CustomStringConvertible

extension Progression: CustomStringConvertible {

    var description: String {
        var chordsString = ""
        var scaleStepsString = ""

        for (offset, chord) in chords.enumerated() {
            if offset == chords.count - 1 {
                chordsString.append("\(chord)")
                scaleStepsString.append("\(scaleSteps?[offset] ?? .one)")
                continue
            }

            chordsString.append("\(chord) -> ")
            scaleStepsString.append("\(scaleSteps?[offset] ?? .one) -> ")
        }

        let progressionString = """
            \(chordsString)
            \(scaleStepsString)
            """

        return progressionString
    }

}
