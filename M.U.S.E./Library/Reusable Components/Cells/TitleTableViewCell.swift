import UIKit

final class TitleTableViewCell: UITableViewCell {

    // MARK: - Private Outlets

    @IBOutlet private weak var titleLabel: UILabel!

    // MARK: - Public Properties

    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }

    var textStyle: UIFont.TextStyle? {
        didSet {
            guard let textStyle else { return }
            titleLabel.font = .preferredFont(forTextStyle: textStyle)
        }
    }

    var alignment: NSTextAlignment? {
        didSet {
            guard let alignment else { return }
            titleLabel.textAlignment = alignment
        }
    }

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }

}

// MARK: - Configuration

private extension TitleTableViewCell {

    func configureAppearance() {
        titleLabel.font = .preferredFont(forTextStyle: .body)
    }

}
