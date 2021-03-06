//
//  addCityViewController.swift
//  myBook
//
//  Created by Ravi Thakur on 02/10/20.
//

import UIKit
import RealmSwift

class addCityViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    var excistinfcity: Book?
    
    @IBOutlet var selectImage: UITapGestureRecognizer!
    
    @IBOutlet weak var cityName: UITextField!
    
    @IBOutlet weak var cityInfo: UITextField!
    
    @IBOutlet weak var cityImage: UIImageView!
    
    @IBOutlet weak var cityPrice: UITextField!
    
    @IBOutlet weak var cityFam: UITextField!
    
    @IBOutlet weak var cityRating: UITextField!
    
    let picker = UIImagePickerController()
    
    let Data = Book()
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityImage.isUserInteractionEnabled = true
        cityImage.addGestureRecognizer(selectImage)
    }
    
    
    
    @IBAction func saveCity(_ sender: Any) {
        
        //MARK: - save to Realm database
      
            if let name = cityName.text, let info = cityInfo.text, let image = cityImage.image , let price = cityPrice.text, let fampoint = cityFam.text, let rating = cityRating.text{
                
                if let imagedata = image.jpegData(compressionQuality: 0.5){
                    
                    Data.cityName = name
                    Data.cityIntro = info
                    Data.cityImages = imagedata as NSData
                    Data.cityFam = fampoint
                    Data.cityPrice = price
                    Data.cityRating = (rating as NSString).doubleValue
                    
                }
                
            }
            
            //got data in block now save to realm
            
            try? realm.write{
                realm.add(Data)
            }
            
        
        
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    
    //MARK: - pick and set image
    
    @IBAction func selectcity(_ sender: Any) {
        
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
        
        
    }
    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)
        
        if let selectedimage = image{
        cityImage.image = selectedimage
            
            picker.dismiss(animated: true, completion: nil)
        }else{
            
            debugPrint("select CourseImage")
        }
    }
    
}
