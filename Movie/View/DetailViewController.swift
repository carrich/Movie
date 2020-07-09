//
//  DetailViewController.swift
//  Movie
//
//  Created by Ngoduc on 7/9/20.
//  Copyright © 2020 com.techmaster.D. All rights reserved.
//

import UIKit
import Kingfisher
import AVKit

class DetailViewController: UIViewController {
    //MARK: - IBoutlets
    
    @IBOutlet weak var primaryLable: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var priceLable: UILabel!
    @IBOutlet weak var aristNameLable: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var trackNameLable: UILabel!
    
    //MARK: - vars
    var trackName: String!
    var primary: String!
    var country: String!
    var price: Double!
    var aristName :String!
    var photo: String!
    var movieURL: String!
    var movie: Movie!{
        didSet{
            trackName = movie.trackName
            primary = movie.primaryGenreName
            country = movie.country
            price = movie.trackPrice
            aristName = movie.artistName
            photo = movie.artworkUrl100
            movieURL = movie.previewURL
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()

        
    }


    //MARK: - Helfper funtion
   private func configureView(){
    photoImageView.contentMode = .scaleAspectFill
    photoImageView.kf.setImage(with: URL(string: photo))
    primaryLable.text = "Type: \(primary!)"
    countryLabel.text = "Country: \(country!)"
    priceLable.text = "Price: \(price!)"
    aristNameLable.text = "AristName \(aristName!)"
    trackNameLable.text = "\(trackName!)"
    
    }
    
    //MARK: - IBAction
    
    @IBAction func playButtonPressed(_ sender: Any) {
        let player = AVPlayer(url: URL(string: movieURL!)!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true){
            playerViewController.player?.play()
        }
    }
    
}
