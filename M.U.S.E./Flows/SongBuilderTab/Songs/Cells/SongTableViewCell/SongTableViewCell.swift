import UIKit

final class SongTableViewCell: UITableViewCell {

    // MARK: - Private Outlets

    @IBOutlet private weak var songNameLabel: UILabel!

    // MARK: - Public Properties

    var songName: String? {
        didSet {
            songNameLabel.text = songName
        }
    }

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }

}

// MARK: - Configuration

private extension SongTableViewCell {

    func configureAppearance() {
        songNameLabel.font = .systemFont(ofSize: 18)
        songNameLabel.numberOfLines = 0
    }

}
