//
//  GalleryViewController.swift
//  VKClientApp
//
//  Created by Sergey Simashov on 01.12.2021.
//

import UIKit

class GalleryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var sourceArray = ["2","2","2","4","2"]
   
    let reuseIdentifier = "reuseIdentifier"
    let moveToPhoto = "moveToPhoto"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
    }


}


extension GalleryViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sourceArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CustomCollectionViewCell
        cell.configure(image: UIImage(named: sourceArray[indexPath.item]), index: indexPath.item)
        
        return cell
    }
    
}


extension GalleryViewController: UICollectionViewDelegate {
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == moveToPhoto,
        let photo = sender as? UIImage,
           let destination = segue.destination as? PhotoViewController {
            destination.photo = photo
           
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let photo = UIImage(named: sourceArray[indexPath.item]) {
        performSegue(withIdentifier: moveToPhoto, sender: photo)
        }
}
    

}





extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        let whiteSpace = CGFloat(1)
        let lineCountCell = CGFloat(2)
        let cellWidth = collectionViewWidth / lineCountCell - whiteSpace
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    
}
