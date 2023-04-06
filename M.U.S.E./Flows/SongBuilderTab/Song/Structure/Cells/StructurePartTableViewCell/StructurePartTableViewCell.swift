import UIKit

final class StructurePartTableViewCell: UITableViewCell {

    // MARK: - Private Outlets

    @IBOutlet private weak var structurePartButton: UIButton!
    @IBOutlet private weak var barsLabel: UILabel!
    @IBOutlet private weak var barsStepper: UIStepper!
    @IBOutlet private weak var repeatingLabel: UILabel!
    @IBOutlet private weak var repeatingStepper: UIStepper!

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }

}

// MARK: - Configuration

private extension StructurePartTableViewCell {

    func setupInitialState() {
        setupButtons()
        setupLabels()
        setupSteppers()
    }

    func setupButtons() {
        var actions: [UIAction] = []

        StructurePart.allCases.forEach { actions.append(.init(title: $0.description, state: .on, handler: { action in })) }

        let menu = UIMenu(title: L10n.SongBuilder.Detail.menuTitle, identifier: nil, options: [], children: actions)

        structurePartButton.menu = menu
    }

    func setupLabels() {
        barsLabel.text = "\(0)"
        barsLabel.font = .systemFont(ofSize: 14)

        repeatingLabel.text = "\(0)"
        repeatingLabel.font = .systemFont(ofSize: 14)
    }

    func setupSteppers() {
        [barsStepper, repeatingStepper].forEach { stepper in
            stepper?.minimumValue = 0
            stepper?.stepValue = 1
            stepper?.autorepeat = true
            stepper?.maximumValue = 100
        }

        barsStepper.addTarget(self, action: #selector(updateBarLabel), for: .valueChanged)
        repeatingStepper.addTarget(self, action: #selector(updateRepeatingLabel), for: .valueChanged)
    }

    @objc
    private func updateBarLabel() {
        barsLabel.text = String(Int(barsStepper.value))
    }

    @objc
    private func updateRepeatingLabel() {
        repeatingLabel.text = String(Int(repeatingStepper.value))
    }

}
