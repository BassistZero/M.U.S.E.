import UIKit

final class StructurePartTableViewCell: UITableViewCell {

    // MARK: - Private Outlets

    @IBOutlet private weak var structurePartButton: UIButton!
    @IBOutlet private weak var barNameLabel: UILabel!
    @IBOutlet private weak var barsLabel: UILabel!
    @IBOutlet private weak var barsStepper: UIStepper!
    @IBOutlet private weak var repeatingBarNameLabel: UILabel!
    @IBOutlet private weak var repeatingLabel: UILabel!
    @IBOutlet private weak var repeatingStepper: UIStepper!

    // MARK: - Public Events

    var didChanged: ((StructurePart) -> Void)?

    // MARK: - Public Properties

    var title: String? {
        return titleName
    }

    // MARK: - Private Properties

    private var titleName = L10n.StructurePart.intro

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
        setupSteppers()
        setupLabels()
    }

    func setupButtons() {
        var actions: [UIAction] = []

        StructurePart.allCases.forEach { structurePart in
            actions.append(.init(title: structurePart.description, state: .on, handler: { _ in
                self.didChanged?(structurePart)
                self.titleName = structurePart.description
            }))

        }

        let menu = UIMenu(title: L10n.SongBuilder.Detail.Structure.Main.menuTitle, identifier: nil, options: [], children: actions)

        structurePartButton.menu = menu
        structurePartButton.showsMenuAsPrimaryAction = true
    }

    func setupLabels() {
        barNameLabel.text = L10n.SongBuilder.Detail.Structure.Main.barName
        barNameLabel.font = .boldSystemFont(ofSize: 12)

        repeatingBarNameLabel.text = L10n.SongBuilder.Detail.Structure.Main.repeatingBarName
        repeatingBarNameLabel.font = .boldSystemFont(ofSize: 12)

        barsLabel.text = "\(Int(barsStepper.value))"
        barsLabel.font = .systemFont(ofSize: 14)

        repeatingLabel.text = "\(Int(repeatingStepper.value))"
        repeatingLabel.font = .systemFont(ofSize: 14)
    }

    func setupSteppers() {
        [barsStepper, repeatingStepper].forEach { stepper in
            stepper?.minimumValue = 1
            stepper?.stepValue = 1
            stepper?.autorepeat = true
            stepper?.maximumValue = 100
        }

        barsStepper.value = 4

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
