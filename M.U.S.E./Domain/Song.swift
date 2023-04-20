final class Song {

    // MARK: - Public Properties

    var instruments: [Instrument]
    var structure: [StructurePart]
    var name: String?
    var key: Key?
    var time: Time?
    var tempo: Int?
//    var genre: Genre?
    var scale: Scale?
    var songParts: [SongPart] = []

    // MARK: - Inits

    init(instruments: [Instrument] = [], structure: [StructurePart] = [], named name: String? = nil, setup: Setup? = Setup(key: .init(value: .c, color: .minor), time: .init(up: 4, down: .quarter), tempo: 120, genre: .rock)) {
        self.instruments = instruments
        self.structure = structure
        self.name = name
        key = setup?.key
        time = setup?.time
        tempo = setup?.tempo
//        genre = setup?.genre
    }

    // MARK: - Public Methods

    func addSongPart(_ songPart: SongPart) {
        songParts.append(songPart)
    }

    func getAllSongParts() -> [SongPart] {
        return songParts
    }

    func getSongPartsString(from songParts: [SongPart]) -> String {
        var result = ""

        songParts.forEach { songPart in
            result.append(songPart.description + "\n\n")
        }

        return result
    }

}

// MARK: - CustomStringConvertible

extension Song: CustomStringConvertible {

    var description: String {
        let songParts = getAllSongParts()

        let songPartsString = !songParts.isEmpty ? getSongPartsString(from: songParts) : "Empty"

        return
            """
            Name: \(name ?? "")
            Key: \(key?.description ?? "Empty")
            Time: \(time?.description ?? "Empty")
            Tempo: \(tempo?.description ?? "Empty")
            Structure: \(structure.description.dropFirst().dropLast())
            Instruments: \(instruments.description.dropFirst().dropLast())

            Song Parts:

            \(songPartsString)
            """
    }

}
