import UIKit

final class ProgressionViewController: UIViewController {

    // MARK: - Private Outlets

    @IBOutlet private weak var progressionConfigurationView: ProgressionConfigurationView!
    @IBOutlet private weak var progressionTextView: UITextView!
    @IBOutlet private weak var polyphonySwitch: UISwitch!
    @IBOutlet private weak var generateProgressionButton: UIButton!
    @IBOutlet private weak var playProgressionButton: UIButton!
    @IBOutlet private weak var blacklistProgressionButton: UIButton!

    // MARK: - Private Properties

    private var progression: Progression?
    private var progressionPlayer: ProgressionPlayer?

}

// MARK: - UIViewController

extension ProgressionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
    }

}

// MARK: - Configuration

private extension ProgressionViewController {

    func setupInitialState() {
        configureButtonsText()
        configureProgressionView()
        configureProgressionPlayer()
    }

    func configureButtonsText() {
        generateProgressionButton.setTitle(L10n.ProgressionViewController.Buttons.generateProgression, for: .normal)
        playProgressionButton.setTitle(L10n.ProgressionViewController.Buttons.playProgression, for: .normal)
        blacklistProgressionButton.setTitle(L10n.ProgressionViewController.Buttons.blacklistProgression, for: .normal)
    }

    func configureProgressionView() {
        progression = progressionConfigurationView.progression
        progressionTextView.text = progression?.description
    }

    func configureProgressionPlayer() {
        progressionPlayer = ProgressionPlayer()
    }

}

// MARK: - IBActions

extension ProgressionViewController {

    @IBAction func GenerateProgression(_ sender: UIButton) {
        configureProgressionView()
//        Progression.blacklistBadProgressions()
    }

    @IBAction func playProgression(_ sender: UIButton) {
        playProgression()
    }

    @IBAction func blacklistProgression(_ sender: UIButton) {
        blacklistProgression()
    }

}

// MARK: - Private Methods

private extension ProgressionViewController {

    func playProgression() {
        polyphonySwitch.isOn ? playProgressionWithPolyphony() : playProgressionWithoutPolyphony()
    }

    func playProgressionWithoutPolyphony() {
        if let progression = progression {
            progressionPlayer?.play(progression: progression, isPolyphony: false)
        }
    }

    func playProgressionWithPolyphony() {
        if let progression = progression {
            progressionPlayer?.play(progression: progression)
        }
    }

    func blacklistProgression() {
        guard let scaleSteps = progression?.scaleSteps else { print("no scale steps found"); return }

        ScaleStepsBlacklist.shared.add(scaleSteps)
    }

}
