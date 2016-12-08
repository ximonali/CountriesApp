//
//  ViewController.swift
//  Simon_Gonzalez_Lab2
//
//  Created by macadmin on 2016-03-28.
//  Copyright (c) 2016 macadmin. All rights reserved.
//

import UIKit
import CoreData

class Profile: UIViewController {

    //Vars
    var myProvincesOBJ = Provinces();
    
    //Vars CoreData
    var managedObjectContextOBJ = (UIApplication.shared.delegate as!AppDelegate).managedObjectContext
    var error: NSError?
    
    //Controls
    @IBAction func cargarCities(_ sender: UIButton) {
        loadCities();
        
    }
    
    @IBOutlet weak var lblAlberta: UILabel!
    @IBOutlet weak var lblFlorida: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //saveCities(); LOADED JUST ONCE!!!!!!! TO NOT DUPLICATE!!
        loadCities()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func saveCities(){
        //Geting a reference to your Entity Table : LogItem
        let newItem = NSEntityDescription.insertNewObject(forEntityName: "UserInfo", into: self.managedObjectContextOBJ!) as! UserInfo
        
        newItem.alberta = "Calgary";
        newItem.alberta = "Edmonton";
        newItem.alberta = "Red Deer";
        newItem.alberta = "Lethbridge";
        newItem.alberta = "St. Albert";
        newItem.alberta = "Medicine Hat";
        
        newItem.ontario = "Mississauga";
        newItem.ontario = "Brampton";
        newItem.ontario = "Oakville";
        newItem.ontario = "Oshawa";
        newItem.ontario = "Markham";
        
        newItem.quebec = "Bas-Saint-Laurent";
        newItem.quebec = "Mauricie";
        newItem.quebec = "Estrie";
        newItem.quebec = "Montreal";
        newItem.quebec = "Laval";
        
        newItem.florida = "Big Bend";
        newItem.florida = "Central Florida";
        newItem.florida = "Gold Coast";
        newItem.florida = "Miami";
        
        newItem.kansas = "Sacramento";
        newItem.kansas = "Los Angeles";
        newItem.kansas = "San Diego";
        newItem.kansas = "San Francisco";
        
        newItem.california = "Wichita";
        newItem.california = "Kansas City";
        newItem.california = "Lawrence";
        newItem.california = "Salina";
        
        do {
            try managedObjectContextOBJ?.save()
        } catch let error1 as NSError {
            error = error1
        }
    }
    
    func loadCities(){
        var city1: String = "";
        var city2: String = "";
        //Create a new fetch request using the LogItem entity
//        let fetchRequest2 = NSFetchRequest(entityName: "UserInfo")
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "UserInfo")
        
        //Execute the fetch request, and cast the results to an array of LogItem objects
        if let fetchResults = (try? managedObjectContextOBJ!.fetch(fetchRequest)) as? [UserInfo] {
            
            //mostrar o array que o banco de dados criou com nome de fetchResults
            for item in fetchResults{

                myProvincesOBJ.myAlberta.append(item.alberta);
                myProvincesOBJ.myOntario.append(item.ontario);
                myProvincesOBJ.myQuebec.append(item.quebec);
                myProvincesOBJ.myFlorida.append(item.florida);
                myProvincesOBJ.myKansas.append(item.kansas);
                myProvincesOBJ.myCalifornia.append(item.california);
                
                city1 += "-\(item.alberta)"
                city2 += "-\(item.florida)"
                
             }
            lblAlberta.text = "Test Alberta: \(city1)"
            lblFlorida.text = "Test Florida: \(city2)"

           }
        
        }
    

    
    

}

