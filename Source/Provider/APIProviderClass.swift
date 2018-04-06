//
//  APIProviderClass.swift
//  estagiaria
//
//  Created by Gian Nucci on 01/03/18.
//  Copyright © 2018 Gian Nucci. All rights reserved.
//

import Foundation
import Alamofire
import UIKit



class ApiProvider{
    
    func fetchPopularMovies(page:Int, callBack: @escaping (FileMovie) -> Void){
        
        let request = MovieRequest(apiPage: page)
        guard let data = try? JSONEncoder().encode(request)else {return}
        
        guard let dictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else { return }
        
        Alamofire.request("https://api.themoviedb.org/3/movie/popular", method: .get, parameters: dictionary, encoding: URLEncoding(destination: .queryString), headers: nil).responseData { (dataCallBack) in
            if let dataDecoder = dataCallBack.data {
                guard let movie = try? JSONDecoder().decode(FileMovie.self, from: dataDecoder) else {return}
                callBack(movie)
            }
        }
    }
    
    func fetchImageMovies(stringImg: String, callBackImage: @escaping (UIImage) -> Void){
        
        Alamofire.request("https://image.tmdb.org/t/p/w500"+stringImg, method: .get, parameters: nil, encoding: URLEncoding(destination: .queryString), headers: nil).responseData { (dataImgCallBack) in
            if let dataImgDecoder = dataImgCallBack.data {
                guard let image = UIImage(data: dataImgDecoder) else {return}
                callBackImage(image)
                
            }
        }
    }
            
            
            
}
