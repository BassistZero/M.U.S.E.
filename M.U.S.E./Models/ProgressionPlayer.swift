import AVFoundation

struct ProgressionPlayer {

    // MARK: - Private Properties

    private var players = [ChordPlayer]()

    // MARK: - Public Methods

    mutating func play(progression: Progression, chordsDelay: Double = 0.75, notesDelay: Double = 0) {
        var players = makePlayers(progression: progression)

        players.forEach { $0.stop() }

        var generalDelay = 0.0

        for offset in 0...players.count {

            DispatchQueue.global().asyncAfter(deadline: .now() + generalDelay) {
                guard offset != players.count else {
                    return
                }

                players[offset].play(chord: progression.chords[offset], delay: notesDelay)
            }

            generalDelay += chordsDelay
        }
    }

}

// MARK: - Private Methods

private extension ProgressionPlayer {

    mutating func makePlayers(progression: Progression) -> [ChordPlayer] {
        players.forEach { $0.stop() }
        players = []

        progression.chords.forEach { _ in
            let player = ChordPlayer()
            players.append(player)
        }

        return players
    }
}
