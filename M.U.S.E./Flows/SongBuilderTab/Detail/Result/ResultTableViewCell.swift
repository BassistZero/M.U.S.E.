import UIKit

final class ResultTableViewCell: UITableViewCell, SongBuilderPart {

    // MARK: - Private Outlets

    @IBOutlet private weak var songTextView: UITextView!

    var song: Song? {
        didSet {
            songTextView.text = song?.description
        }
    }
    var rootNavigationController: UINavigationController?

    override func awakeFromNib() {
        super.awakeFromNib()
        songTextView.isEditable = false
    }

}
