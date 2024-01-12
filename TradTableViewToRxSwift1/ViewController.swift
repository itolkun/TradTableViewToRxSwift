//
//  ViewController.swift
//  TradTableViewToRxSwift1
//
//  Created by Айтолкун Анарбекова on 10.01.2024.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
   @IBOutlet weak var tableView: UITableView!
    
    let tableViewItems = Observable.just([Food.init(name: "Hamburger", image: "hamburger"),
                                         Food.init(name: "Pizza", image: "pizza"),
                                         Food.init(name: "Salmon", image: "salmon"),
                                         Food.init(name: "Spaghetti", image: "spaghetti")])
    
    let disposeBag = DisposeBag()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Menu"
        tableView.rowHeight = 100
        tableViewItems
            .bind(to: tableView
                .rx
                .items(cellIdentifier: "myCell", cellType: FoodTableViewCell.self)) {
                    (cv, tableViewItem, cell) in
                    cell.foodImageView.image = UIImage.init(named: tableViewItem.image)
                    cell.foodLabel.text = tableViewItem.name
                    
                    
                }
                .disposed(by: disposeBag)
        
        tableView
            .rx.modelSelected(Food.self)
            .subscribe (onNext: { food in
                if let foodVC = self.storyboard?.instantiateViewController(identifier: "FoodVC") as? FoodDetailViewController {
                    foodVC.imageName = food.image
                    self.navigationController?.pushViewController(foodVC, animated: true)
                } else {
                    print("Unable to instantiate FoodDetailViewController from storyboard.")
                }
            }).disposed(by: disposeBag)
        
        tableView
            .rx
            .itemSelected
            .subscribe(onNext: {
                indexPath in
                
            }).disposed(by: disposeBag)
        
        
    }
    
}


