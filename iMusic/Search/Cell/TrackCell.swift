//
//  TrackCell.swift
//  iMusic
//
//  Created by Дмитрий Кириченко on 23.12.2020.
//

import UIKit
import SDWebImage

protocol TrackCellViewModel {
    var iconUrlString: String? { get }
    var trackName: String { get }
    var artistName: String { get }
    var collectionName: String { get }

}

class TrackCell: UITableViewCell {
    
    static let reuseId = "TrackCell"
    
    @IBOutlet var trackNameLabel: UILabel!
    @IBOutlet var artistNameLabel: UILabel!
    @IBOutlet var collectionNameLabel: UILabel!
    @IBOutlet var trackImageView: UIImageView!
    @IBOutlet var addTrackOutlet: UIButton!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        trackImageView.image = nil
    }
    
    var cell: SearchViewModel.Cell?
    
    func set(viewModel: SearchViewModel.Cell) {
        
        self.cell = viewModel
        
        let savedTracks = UserDefaults.standard.savedTracks()
        let hasFavourite = savedTracks.firstIndex(where: {
            $0.trackName == self.cell?.trackName && $0.artistName == self.cell?.artistName
        }) != nil
        if hasFavourite {
            addTrackOutlet.isHidden = true
        } else {
            addTrackOutlet.isHidden = false
        }
        
        trackNameLabel.text = viewModel.trackName
        artistNameLabel.text = viewModel.artistName
        collectionNameLabel.text = viewModel.collectionName.uppercased()
        
        guard let url = URL(string: viewModel.iconUrlString ?? "") else { return }
        
        trackImageView.sd_setImage(with: url, completed: nil)
        
    }
    
    @IBAction func addTrackAction(_ sender: Any) {

        let defaults = UserDefaults.standard
        guard let cell = cell else { return }
        addTrackOutlet.isHidden = true
        
        var listOfTracks = defaults.savedTracks()
        
        listOfTracks.append(cell)
        
        if let saveData = try? NSKeyedArchiver.archivedData(withRootObject: listOfTracks, requiringSecureCoding: false) {
            print("Успех")
            defaults.set(saveData, forKey: UserDefaults.favouriteTrackKey)
        }
    }
    
}
