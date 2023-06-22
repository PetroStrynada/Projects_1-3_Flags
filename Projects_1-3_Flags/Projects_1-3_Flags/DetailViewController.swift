//
//  DetailViewController.swift
//  Projects_1-3_Flags
//
//  Created by Petro Strynada on 21.06.2023.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedCountry: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = selectedCountry?.uppercased()
        navigationItem.largeTitleDisplayMode = .never

        if let imageToLoad = selectedCountry {
            imageView.image = UIImage(named: imageToLoad)?.resize(toSize: CGSize(width: 450, height: 300))
            imageView.layer.borderWidth = 1.0
            imageView.layer.borderColor = UIColor.gray.cgColor
            
        }
    }

}
