final class SongPart {

    var instrumentParts: [InstrumentPart]
    var structurePart: StructurePart
    var progression: Progression?
    var isReusing: Bool

    init(instrumentParts: [InstrumentPart] = [], instrument: Instrument? = nil, structurePart: StructurePart, progression: Progression? = nil, isReusing: Bool = true) {
        self.instrumentParts = instrumentParts
        self.structurePart = structurePart
        self.progression = progression
        self.isReusing = isReusing
    }

}

// MARK: - CustomStringConvertible

extension SongPart: CustomStringConvertible {

    var description: String {
        let instrumentPartsString = instrumentParts.isEmpty ? "Empty" : instrumentParts.description.dropFirst().dropLast()
        let progressionString = progression?.description ?? "Empty"

        return """
            instrumentParts: \(instrumentPartsString)
            structure part: \(structurePart)
            progression: \(progressionString)
            Reusing: \(isReusing)
            """
    }

}
