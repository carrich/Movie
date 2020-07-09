//
//  ViewController.swift
//  Movie
//
//  Created by Ngoduc on 7/7/20.
//  Copyright © 2020 com.techmaster.D. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import Kingfisher
import SDWebImage

class ViewController: UIViewController {
    
     // MARK: - Properties
    
    var collectionView: UICollectionView!
    var searchBar: UISearchBar!
    var movies = [Movie]()
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        fetchMovies()
        configureSearchBar()
     
    }
    // MARK: - Helper Functions
    func configureCollectionView(){
        let layout = UICollectionViewFlowLayout() 
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.delegate  = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.reuseIdentifier)
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
  
    }
    func configureSearchBar() {
        searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.sizeToFit()
        searchBar.showsCancelButton = false
//        searchBar.becomeFirstResponder()
        searchBar.tintColor = .white
        navigationItem.titleView = searchBar
    }
    func fetchMovies() {
        getAllQuestion {[weak self] data in
            print(data.results.count)
            self?.movies = data.results
            self?.collectionView.reloadData()
        }
    }
    
    
}

//MARK: - setData
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.reuseIdentifier, for: indexPath) as! MovieCollectionViewCell
        cell.nameLabel.text = movies[indexPath.row].trackName
        cell.imageView.kf.setImage(with: URL(string: movies[indexPath.row].artworkUrl100))
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.movie = movies[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
// MARK: - UICollectionViewFlowLayout

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 32, left: 8, bottom: 0, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width - 30) / 2
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
}
extension ViewController: UISearchBarDelegate {
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == "" || searchBar.text == nil {
            collectionView.reloadData()
            view.endEditing(true)
        } else {
            let urlString  = String(format: "https://itunes.apple.com/search?term=%@&limit=10", searchText)
               AF.request(urlString).response{[weak self] data in
                          switch data.result {
                          case .failure(let error):
                              print(error.localizedDescription)
                          case .success(let result):
                              let data = Movies(JSON(result))
                              self?.movies = data.results
                              self?.collectionView.reloadData()
                              print(data.results)
                              for movie in data.results {
                                  print(movie.previewURL)
                              }
                             
                          }
                      }
        }
    }
}
