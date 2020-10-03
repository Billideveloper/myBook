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
    
    var relamsaveddata = [Book]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        
        getdata()
        
        //print(relamsaveddata)
    
    }

    //MARK: - fetch data from Realm
    

    override func viewWillAppear(_ animated: Bool) {
        
        
        relamsaveddata = []
        
        let data = realm.objects(Book.self)
        
        for Book in data{
            relamsaveddata.append(Book)
        }
        
        DispatchQueue.main.async {
            self.tableview.reloadData()
        }
    }
    
    

    //MARK: - tableviewmethods
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = relamsaveddata.count
        return data
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 348
    }
    

//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 400
//    }
    
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
        let radius = cell.contentView.layer.cornerRadius
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: radius).cgPath
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "city", for: indexPath) as! cityTableViewCell
        
    
        let mdata = relamsaveddata[indexPath.row]
    
        cell.cityName.text = mdata.cityName
        cell.cityCost.text = "\(mdata.cityPrice) Rs"
        cell.cityFam.text = mdata.cityFam
        cell.cityInfo.text = mdata.cityIntro
        cell.cityRating.text = "\(mdata.cityRating) / 5"
        
        if let imagedata = mdata.cityImages{

        if let image = UIImage(data: imagedata as Data){

            cell.cityImage.image = image
        }
    }
        
        
        
        return cell
    }
    
    
    func getdata(){
        
        let data = realm.objects(Book.self)
        
        for Book in data{
            relamsaveddata.append(Book)
        }
    
        
    }
    
//    func fetchdata(){
//
//
//        let data = realm.objects(Book.self)
//
//
//
//        for Book in data{
//            cell.cityCost.text = Book.cityPrice
//            cell.cityFam.text = Book.cityFam
//            cell.cityInfo.text = Book.cityIntro
//            cell.cityName.text = Book.cityName
//            cell.cityRating.text = "\(Book.cityRating) of 5"
//
//
//            if let imagedata = Book.cityImages{
//
//                if let image = UIImage(data: imagedata as Data){
//
//                    cell.cityImage.image = image
//                }
//            }
//        }
//    }
    
    
    

}

