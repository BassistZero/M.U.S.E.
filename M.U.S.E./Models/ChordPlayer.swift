import AVFoundation

struct ChordPlayer {

    // MARK: - Private Properties

    private var players = [AVAudioPlayer]()

    // MARK: - Public Methods

    mutating func play(chord: Chord, delay: Double = 0) {
        let players = makePlayers(chord: chord)

        var generalDelay = 0.0

        players.forEach {
            $0.play(atTime: $0.deviceCurrentTime + generalDelay)
            generalDelay += delay
        }
    }

}

// MARK: - Private Methods

private extension ChordPlayer {

    mutating func makePlayers(chord: Chord) -> [AVAudioPlayer] {
        players.forEach { $0.stop() }
        players = []

        chord.notes.forEach { note in
            let filePath = Bundle.main.path(forResource: note.description, ofType: "mp3", inDirectory: nil)
            let url = URL(fileURLWithPath: filePath ?? "")
            let player = try? AVAudioPlayer(contentsOf: url)
            players.append(player ?? AVAudioPlayer())
        }

        return players
    }

}