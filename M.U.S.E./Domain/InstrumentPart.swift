struct InstrumentPart {

    var bars: [Bar] = []
    var instrument: Instrument

}

// MARK: -

extension InstrumentPart: CustomStringConvertible {

    var description: String {
        let barsString = bars.isEmpty ? "Empty" : bars.description.dropFirst().dropLast()

        return """
            instrument: \(instrument.description)

            bars: \(barsString)
            """
    }

}
