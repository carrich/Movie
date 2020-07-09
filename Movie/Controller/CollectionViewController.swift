//
//  CollectionViewController.swift
//  Movie
//
//  Created by Ngoduc on 7/8/20.
//  Copyright © 2020 com.techmaster.D. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {
    // MARK: - Properties
    
    var searchBar: UISearchBar!
    var movies = [Movie]()
    var filteredMovies = [Movie]()
    var inSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
        fetchMovies()
    }
    func fetchMovies() {
        getAllQuestion {[weak self] data in
               print(data.results.count)
               self?.movies = data.results
               self?.collectionView.reloadData()
           }
    }
     func configureViewComponents() {
        collectionView.register(MovieTableViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.backgroundColor = .white
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        // Configure the cell
        
        return cell
    }
    
    
}
