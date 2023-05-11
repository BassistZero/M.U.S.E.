import AVFoundation

final class ProgressionPlayer {

    // MARK: - Private Properties

    private var players = [ChordPlayer]()
    private var offset = 0
    private var generalDelay = 0.0
    private var timer: Timer?

    // MARK: - Public Methods

    func play(progression: Progression, chordsDelay: Double = 0.75, isPolyphony: Bool = true) {
        stop()

        let notesDelay = isPolyphony ? 0 : chordsDelay / Double(progression.chords.first?.notes.count ?? 1)

        makePlayers(progression: progression)

    for _ in players {
        timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(floatLiteral: generalDelay + chordsDelay), repeats: false) { [self] timer in
            playProgression(progression: progression, notesDelay: notesDelay)
            updateOffset()
            timer.invalidate()
        }

        generalDelay += chordsDelay
    }

    }

    func stop() {
        players.forEach { $0.stop() }
        players = []
        timer?.invalidate()
        timer = nil

        offset = 0
        generalDelay = 0.0
    }

}

// MARK: - Private Methods

private extension ProgressionPlayer {

    func makePlayers(progression: Progression) {
        progression.chords.forEach { _ in players.append(ChordPlayer()) }
    }

    func playProgression(progression: Progression, notesDelay: Double) {
        players[offset].play(progression.chords[offset], delay: notesDelay)
    }

    func updateOffset() {
        if offset >= players.count - 1 {
            offset = 0
        }

        offset += 1
    }

}
