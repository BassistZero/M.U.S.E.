import UIKit

final class ResultTableViewCell: UITableViewCell, SongBuilderPart {

    var song: Song? {
        didSet {
            songTextView.text = song?.description
        }
    }
    var rootNavigationController: UINavigationController?

    // MARK: - Private Outlets

    @IBOutlet private weak var songTextView: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        songTextView.isEditable = false
    }

}
