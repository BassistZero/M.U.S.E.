import AVFoundation

final class ProgressionPlayer {

    // MARK: - Private Properties

    private var players = [ChordPlayer]()

    // MARK: - Public Methods

    func play(progression: Progression, chordsDelay: Double = 0.75, isPolyphony: Bool = true) {
        stop()

        players = makePlayers(progression: progression)

        var generalDelay = 0.0

        let notesDelay = isPolyphony ? 0 : chordsDelay / Double(progression.chords.first?.notes.count ?? 1)

        for (offset, _) in players.enumerated() {
            DispatchQueue.global().asyncAfter(deadline: .now() + generalDelay) {
                self.players[offset].play(chord: progression.chords[offset], delay: notesDelay)
            }

            generalDelay += chordsDelay
        }

}

func stop() {
    players.forEach { $0.stop() }
}

}

// MARK: - Private Methods

private extension ProgressionPlayer {

    func makePlayers(progression: Progression) -> [ChordPlayer] {
        players = []

        progression.chords.forEach { _ in players.append(ChordPlayer()) }

        return players
    }

}
