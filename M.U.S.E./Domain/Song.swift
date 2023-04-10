struct Song {

    // MARK: - Public Properties

    var instruments: [Instrument]?
    var structure: [StructurePart]?
    var name: String?
    var key: Key?
    var time: Time?
    var tempo: Int?
    var genre: Genre?

    // MARK: - Private Properties

    private var songParts: [SongPart] = []

    // MARK: - Inits

    init(instruments: [Instrument]? = nil, structure: [StructurePart]? = nil, named name: String, setup: Setup? = nil) {
        self.instruments = instruments
        self.structure = structure
        self.name = name
        key = setup?.key
        time = setup?.time
        tempo = setup?.tempo
        genre = setup?.genre
    }

    // MARK: - Public Methods

    func getSongParts(for instruments: [Instrument]) -> [[SongPart]]? {
        guard let structure else { return nil }

        var results: [[SongPart]] = []

        for instrument in instruments {
            for structurePart in structure {
                let songPart = songParts.filter { $0.instrument == instrument && $0.structurePart == structurePart }

                guard !songPart.isEmpty else { continue }

                results.append(songPart)
            }
        }

        guard !results.isEmpty else { return nil }

        return results
    }

    mutating func addSongPart(_ songPart: SongPart) {
        songParts.append(songPart)
    }

    func getAllSongParts() -> [SongPart] {
        return songParts
    }

}

// MARK: - CustomStringConvertible

extension Song: CustomStringConvertible {

    var description: String {
        return
            """
            Name: \(name ?? "No name")
            Genre: \(String(describing: genre))
            Key: \(String(describing: key))
            Time: \(String(describing: time))
            Tempo: \(String(describing: tempo))
            Structure: \(String(describing: structure))
            Instruments: \(String(describing: instruments))

            Song Parts:

            \(getAllSongParts())
            """
    }

}
