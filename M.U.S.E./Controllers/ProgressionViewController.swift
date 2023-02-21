import UIKit

final class ProgressionViewController: UIViewController {

    // MARK: - Private Outlets

    @IBOutlet private weak var progressionConfigurationView: ProgressionConfigurationView!
    @IBOutlet private weak var progressionTextView: UITextView!
    @IBOutlet private weak var polyphonySwitch: UISwitch!

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
        configureProgressionView()
        configureProgressionPlayer()
        playProgression()
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
    }

    @IBAction func playProgression(_ sender: UIButton) {
        playProgression()
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

}
