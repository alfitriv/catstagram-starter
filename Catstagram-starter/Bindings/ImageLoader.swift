//
//  ImageLoader.swift
//  InstagramLikeApp
//
//  Created by Vania Radmila Alfitri on 08/11/20.
//

import Foundation
import UIKit
import Firebase

class ImageLoader: ObservableObject {
    let storage = Storage.storage()

     @Published var image: UIImage?
    
    func getImage(from url: URL, completion: @escaping (Result<UIImage, Error>) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                 return
            }
            
            guard let imageData = data, let image = UIImage(data: imageData) else {
                let error = NSError(domain: "", code: 404, userInfo: [:])
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            DispatchQueue.main.async {
                completion(.success(image))
                self.image = image
            }
        }.resume()
    }
    
    func uploadImage(image: UIImage) {
        let data = image.pngData()!
        let storageRef = storage.reference()
        let imageRef = storageRef.child("images/sample.png")
        
        // Upload the file to the path "images/sample.jpg"
        let uploadTask = imageRef.putData(data, metadata: nil) { (metadata, error) in
          guard let metadata = metadata else {
            // Uh-oh, an error occurred!
            return
          }
          // Metadata contains file metadata such as size, content-type.
          let size = metadata.size
          // You can also access to download URL after upload.
          imageRef.downloadURL { (url, error) in
            guard let downloadURL = url else {
              // Uh-oh, an error occurred!
              return
            }
          }
        }
            
    }
}
