//
//  ImageLoader.swift
//  Asnmt2
//
//  Created by Tapas Kumar Patra on 12/10/23.
//
import Kingfisher
import UIKit
extension UIImageView{
    func loadImage(with urlString : String){
        guard let url = URL.init(string: urlString)else{return}
        let resource = KF.ImageResource(downloadURL: url,cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
}


