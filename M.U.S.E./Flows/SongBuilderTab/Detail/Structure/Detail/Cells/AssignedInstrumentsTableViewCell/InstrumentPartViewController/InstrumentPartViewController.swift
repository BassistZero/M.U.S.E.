import UIKit

final class InstrumentPartViewController: UIViewController {

    // MARK: - Private Outlets

    @IBOutlet private weak var infoLabel: UILabel!

    // MARK: - Public Properties

    var instrumentPart: InstrumentPart?
    var progression: Progression?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
    }

}

// MARK: - Configuration

private extension InstrumentPartViewController {

    func setupInitialState() {
        guard let instrumentPart, let progression else { return }
        infoLabel.text = "\(instrumentPart), \(progression)"
    }

}
