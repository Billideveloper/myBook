//
//  ViewController.swift
//  myBook
//
//  Created by Ravi Thakur on 02/10/20.
//

import UIKit
import RealmSwift

class ViewController: UITableViewController {

    
    @IBOutlet var tableview: UITableView!
    
//    var fetchedCity: Results<Book>?
   
    let realm = try! Realm()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        
    
    
    }




    //MARK: - fetch data from Realm
    

    override func viewWillAppear(_ animated: Bool) {
        tableview.reloadData()
    }
    
    

    //MARK: - tableviewmethods
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = realm.objects(Book.self)
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 348
    }
    

//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 400
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "city", for: indexPath) as! cityTableViewCell
        
        let data = realm.objects(Book.self)
        
        for Book in data{
            
            cell.cityCost.text = Book.cityPrice
            cell.cityFam.text = Book.cityFam
            cell.cityInfo.text = Book.cityIntro
            cell.cityName.text = Book.cityName
            cell.cityRating.text = "\(Book.cityRating) of 5"
            
            
            if let imagedata = Book.cityImages{
                
                if let image = UIImage(data: imagedata as Data){
                    
                    cell.cityImage.image = image
                }
            }
        }
        
        return cell
    }
    
    
    
    
    
    

}

