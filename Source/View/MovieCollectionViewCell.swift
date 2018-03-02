//
//  MovieCollectionViewCell.swift
//  estagiaria
//
//  Created by Gian Nucci on 28/02/18.
//  Copyright © 2018 Gian Nucci. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var posterMovie: UIImageView!
    @IBOutlet weak var labelMovie: UILabel!
    
    func loadImage(urlImage:String?){
        guard let img = urlImage else {return}
        ApiProvider().fetchImageMovies(stringImg: img) { (image) in
            self.posterMovie.image = image
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        labelMovie.text = ""
        posterMovie.image = nil
    }
}
