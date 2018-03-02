//
//  MoviesCollectionViewController.swift
//  estagiaria
//
//  Created by Gian Nucci on 28/02/18.
//  Copyright © 2018 Gian Nucci. All rights reserved.
//

import UIKit

private let reuseIdentifier = "MovieCollectionViewCell"

class MoviesCollectionViewController: UICollectionViewController {

    var movies:[Movie] = [] {
        didSet{
            self.collectionView?.reloadData()
        }
    }
    var page:Int = 1
    let provider = ApiProvider()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        provider.fetchPopularMovies(page:page) { (fileMovie) in
            self.movies = fileMovie.results
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return movies.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? MovieCollectionViewCell else { fatalError("Segue o baile")}
        let movie:Movie = self.movies[indexPath.row]
        cell.labelMovie.text = movie.titleMovie
        
        cell.loadImage(urlImage: movie.posterPath)
        
        if indexPath.row == movies.count - 1 {
            page += 1
            
            provider.fetchPopularMovies(page:page) { (fileMovie) in
                ///os dois fazem a mesma coisa, mas um usa o += e  o outro usa append que é a mesma coisa
                ///self.movies += fileMovie.results
                self.movies.append(contentsOf: fileMovie.results)
            }
        }
        

        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
