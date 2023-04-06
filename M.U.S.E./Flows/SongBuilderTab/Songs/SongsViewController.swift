import UIKit

final class SongsViewController: UIViewController {

    // MARK: - Private Outlets

    @IBOutlet private weak var songsTableView: UITableView!
    @IBOutlet private weak var addSongButton: UIButton!

    // MARK: - Private Properties

    private var songs: [Song] = [] {
        didSet {
            songsTableView.reloadData()
        }
    }

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
    }

}

// MARK: - Configuration

private extension SongsViewController {

    func setupInitialState() {
        songsTableView.dataSource = self
        songsTableView.delegate = self

        songsTableView.register(.init(nibName: "\(SongTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(SongTableViewCell.self)")

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

    @objc
    private func addNewSong() {
        let songNameAlertController = UIAlertController(title: L10n.SongBuilder.Main.Alert.title, message: nil, preferredStyle: .alert)

        songNameAlertController.addTextField()
        songNameAlertController.textFields?[0].placeholder = "Song Name"

        let cancelAction = UIAlertAction(title: L10n.SongBuilder.Main.Alert.cancel, style: .cancel)

        let addDummySongNameAction = UIAlertAction(title: L10n.SongBuilder.Main.Alert.proceedWithDummyName, style: .default) { [unowned self] _ in
            self.proceedAsDummy()
        }

        let addSongAction = UIAlertAction(title: L10n.SongBuilder.Main.Alert.proceedWithSongName, style: .default) { [unowned songNameAlertController, self] _ in
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

    func proceedAsDummy(text: String? = nil) {
        var songName: String

        if let text {
            songName = text
        } else {
            songName = L10n.SongBuilder.Main.templateSongName + " \(songs.count + 1)"
        }

        songs.append(Song(named: songName))
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
        let initialViewController = SongBuilderViewController()

        let song = songs[indexPath.row]

        initialViewController.song = song
        initialViewController.title = song.name

        navigationController?.pushViewController(initialViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
