import AVFoundation

final class ChordPlayer {

    // MARK: - Private Properties

    private var players = [AVAudioPlayer]()

    // MARK: - Public Methods

    func play(_ chord: Chord?, delay: Double = 0) {
        stop()

        guard let chord else { return }

        players = makePlayers(chord: chord)

        var generalDelay = 0.0

        DispatchQueue.global().async {
            self.players.forEach {
                $0.play(atTime: $0.deviceCurrentTime + generalDelay)
                generalDelay += delay
            }
        }
    }

    func stop() {
        DispatchQueue.global().async {
            self.players.forEach { $0.stop() }
        }
    }

}

// MARK: - Private Methods

private extension ChordPlayer {

    func makePlayers(chord: Chord) -> [AVAudioPlayer] {
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
