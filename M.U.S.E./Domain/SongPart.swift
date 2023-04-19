struct SongPart {

    var bars: [Bar]?
    var instrument: Instrument?
    var structurePart: StructurePart
    var progression: Progression?

}

// MARK: - CustomStringConvertible

extension SongPart: CustomStringConvertible {

    var description: String {
        let barString = bars?.description ?? "Empty"
        let instrumentString = instrument?.description ?? "Empty"
        let progressionString = progression?.description ?? "Empty"

        return """
            bars: \(barString)
            instrument: \(instrumentString)
            structure part: \(structurePart)
            progression: \(progressionString)
            """
    }

}
