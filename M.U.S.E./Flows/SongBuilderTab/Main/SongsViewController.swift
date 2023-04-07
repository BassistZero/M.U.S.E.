import UIKit

final class SongsViewController: UIViewController {

    // MARK: - Private Outlets

    @IBOutlet private weak var songsTableView: UITableView!
    @IBOutlet private weak var addSongButton: UIButton!
    @IBOutlet private weak var addSongButtonBottomConstraint: NSLayoutConstraint!

    // MARK: - Private Properties

    private var songs: [Song] = []

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
    }

}

// MARK: - Configuration

private extension SongsViewController {

    func setupInitialState() {
        setupTableView()
        setupButtons()
    }

    func setupTableView() {
        songsTableView.dataSource = self
        songsTableView.delegate = self

        songsTableView.register(.init(nibName: "\(SongTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(SongTableViewCell.self)")

        let buttonHeight = addSongButton.frame.height
        let buttonBottomSpacer = addSongButtonBottomConstraint.constant

        songsTableView.contentInset = .init(top: 0, left: 0, bottom: buttonHeight + buttonBottomSpacer, right: 0)
    }

    func setupButtons() {
        var configuration = UIButton.Configuration.filled()
        configuration.image = .init(systemName: "plus.circle.fill")
        configuration.imagePadding = 8
        configuration.cornerStyle = .large

        var attributedTitle = AttributedString(stringLiteral: L10n.SongBuilder.Main.addNewSong)
        attributedTitle.font = .systemFont(ofSize: 16)

        configuration.attributedTitle = attributedTitle

        addSongButton.configuration = configuration

        addSongButton.addTarget(self, action: #selector(addNewSong), for: .touchUpInside)
    }

}

// MARK: - UITableViewDataSource

extension SongsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        songs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(SongTableViewCell.self)", for: indexPath)

        guard let cell = cell as? SongTableViewCell else { return .init() }

        cell.songName = songs[indexPath.row].name

        return cell
    }

}

// MARK: - UITableViewDelegate

extension SongsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        handleRowSelection(on: tableView, for: indexPath)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            handleSongDeletion(on: tableView, for: indexPath)
        }
    }

}

// MARK: - Private Actions

@objc
private extension SongsViewController {

    func addNewSong() {
        let songNameAlertController = UIAlertController(title: L10n.SongBuilder.Main.AddingAlert.title, message: nil, preferredStyle: .alert)

        songNameAlertController.addTextField()
        songNameAlertController.textFields?[0].placeholder = "Song Name"

        let cancelAction = UIAlertAction(title: L10n.SongBuilder.Main.AddingAlert.cancel, style: .cancel)

        let addDummySongNameAction = UIAlertAction(title: L10n.SongBuilder.Main.AddingAlert.proceedWithDummyName, style: .default) { [unowned self] _ in
            self.proceedAsDummy()
        }

        let addSongAction = UIAlertAction(title: L10n.SongBuilder.Main.AddingAlert.proceedWithSongName, style: .default) { [unowned songNameAlertController, self] _ in
            guard let answerTextField = songNameAlertController.textFields?[0], let text = answerTextField.text else { return }

            if text.isEmpty {
                proceedAsDummy()
            } else {
                proceedAsDummy(text: text)
            }
        }

        songNameAlertController.addAction(cancelAction)
        songNameAlertController.addAction(addSongAction)
        songNameAlertController.addAction(addDummySongNameAction)

        present(songNameAlertController, animated: true)
    }

}

// MARK: - Private Methods

private extension SongsViewController {

    func proceedAsDummy(text: String? = nil) {
        var songName: String

        if let text {
            songName = text
        } else {
            songName = L10n.SongBuilder.Main.templateSongName + " \(songs.count + 1)"
        }

        songs += [Song(named: songName)]

        let indexPath = IndexPath(row: songs.count - 1, section: 0)
        songsTableView.insertRows(at: [indexPath], with: .automatic)
    }

    func handleRowSelection(on tableView: UITableView, for indexPath: IndexPath) {
        let initialViewController = SongBuilderViewController()

        let song = songs[indexPath.row]

        initialViewController.song = song
        initialViewController.title = song.name

        navigationController?.pushViewController(initialViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func handleSongDeletion(on tableView: UITableView, for indexPath: IndexPath) {
        let alertController = UIAlertController(title: L10n.SongBuilder.Main.DeletionAlert.title, message: L10n.SongBuilder.Main.DeletionAlert.message, preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: L10n.SongBuilder.Main.DeletionAlert.ok, style: .destructive) { [weak self] _ in
            let index = indexPath.row
            self?.songs.remove(at: index)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        let cancelAction = UIAlertAction(title: L10n.SongBuilder.Main.DeletionAlert.cancel, style: .cancel)

        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)

        present(alertController, animated: true)
    }

}
