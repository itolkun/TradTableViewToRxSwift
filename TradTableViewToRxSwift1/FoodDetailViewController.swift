//
//  FoodDetailViewController.swift
//  TradTableViewToRxSwift1
//
//  Created by Айтолкун Анарбекова on 11.01.2024.
//

import UIKit

class FoodDetailViewController: UIViewController {

    @IBOutlet weak var foodImageView: UIImageView!
    
    var imageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodImageView.image = UIImage.init(named: imageName)
        

    }


}
