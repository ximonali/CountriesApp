//
//  Provinces.swift
//  
//
//  Created by macadmin on 2016-03-28.
//
//

import UIKit


class Provinces: UIViewController,UITableViewDelegate, UITableViewDataSource,UIPickerViewDelegate, UIPickerViewDataSource  {

    //Vars
    var globalIndex: Int = 0;
    var catSelected: String = "Canada";
    var countryArray: [String] = ["Canada","Usa"];
    var TableArray: [String] = [];
    
    var myProvinces: [String] = ["Alberta","Ontario","Quebec"];
    var myProvincesUsa: [String] = ["Florida","California","Kansas"];
    
    var myAlberta: [String] = ["Calgary","Edmonton","Red Deer","Lethbridge","St. Albert","Medicine Hat"];
    //var myAlberta: [String] = [];
    var myOntario: [String] = ["Mississauga","Brampton","Oakville","Oshawa","Markham"];
    var myQuebec: [String] = ["Bas-Saint-Laurent","Mauricie","Estrie","Montreal","Laval"];
    
    var myFlorida: [String] = ["Big Bend","Central Florida","Gold Coast","Miami"]
    var myCalifornia: [String] = ["Sacramento","Los Angeles","San Diego","San Francisco"]
    var myKansas: [String] = ["Wichita","Kansas City","Lawrence","Salina"]

    
    //Controls
    @IBOutlet weak var myCityTable: UITableView!
    @IBOutlet weak var categogyPKView: UIPickerView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myCityTable.delegate = self;
        myCityTable.dataSource = self;
        categogyPKView.delegate = self;
        categogyPKView.dataSource = self;

    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Para Mi DTPICKERVIEW
    
    //1 aqui digo la cantidad de componentes en el PKview (SECCIONES o Cantidad de Componentes)
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1;
    }
    
    //2 aqui retorno la cantidad de mi arreglo (tamano)
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return countryArray.count;
    }
    
    //3 Aqui muestro lo que tiene mi array
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
        return countryArray[row];
    }
    
    //4 AQUI Selecciono el valor
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let value = countryArray[row];
        
        catSelected = value;
        
        if (catSelected == "Canada") {
            TableArray = myProvinces;
            
        }else{ //USA
            TableArray = myProvincesUsa;
            
        }
        
        self.myCityTable.reloadData();
        
    }
    
    
    
    // Para mi TABLE VIEW
    
    //1
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (catSelected == "Canada") {
            if section == 0 {
                return myAlberta.count
                
            }else if section == 1 {
                return myOntario.count
            }else{
                return myQuebec.count
            }
            
        }else{ //USA
            if section == 0 {
                return myFlorida.count
            }else if section == 1 {
                return myCalifornia.count
            }else{
                return myKansas.count
            }
            
        }
        
        
    }//end tableView
    

    
    //2
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if (catSelected == "Canada") {
            return myProvinces.count;
            
        }else{ //USA
            return myProvincesUsa.count
            
        }
        
        //return myProvinces.count
    }
    
    //3
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! TableViewCell
        
        globalIndex = (indexPath as NSIndexPath).row;
        //println("Globalindex MyCell: \(globalIndex)")
        
        if (catSelected == "Canada") {
            if ((indexPath as NSIndexPath).section == 0) {
                cell.lblCity.text  = myAlberta[(indexPath as NSIndexPath).row];
            }else if ((indexPath as NSIndexPath).section == 1)  {
                cell.lblCity.text  = myOntario[(indexPath as NSIndexPath).row];
            }else {
                cell.lblCity.text = myQuebec[(indexPath as NSIndexPath).row];
            }
            
        }else{ //USA
            if ((indexPath as NSIndexPath).section == 0) {
                cell.lblCity.text  = myFlorida[(indexPath as NSIndexPath).row];
            }else if ((indexPath as NSIndexPath).section == 1)  {
                cell.lblCity.text  = myCalifornia[(indexPath as NSIndexPath).row];
            }else {
                cell.lblCity.text = myKansas[(indexPath as NSIndexPath).row];
            }
            
        }
        
        return cell
        
    }
    
    //4
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var SelectedCity: String = "";
        globalIndex = (indexPath as NSIndexPath).row;
        
        if (catSelected == "Canada") {
            if ((indexPath as NSIndexPath).section == 0) {
                SelectedCity  = myAlberta[(indexPath as NSIndexPath).row];
            }else if ((indexPath as NSIndexPath).section == 1)  {
                SelectedCity  = myOntario[(indexPath as NSIndexPath).row];
            }else {
                SelectedCity = myQuebec[(indexPath as NSIndexPath).row];
            }
            
        }else{ //USA
            if ((indexPath as NSIndexPath).section == 0) {
                SelectedCity  = myFlorida[(indexPath as NSIndexPath).row];
            }else if ((indexPath as NSIndexPath).section == 1)  {
                SelectedCity  = myCalifornia[(indexPath as NSIndexPath).row];
            }else {
                SelectedCity = myKansas[(indexPath as NSIndexPath).row];
            }
            
        }
        
        
        let test = UIAlertController(title: "Selected City:", message: SelectedCity, preferredStyle: UIAlertControllerStyle.alert)
        
        let cancelAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        test.addAction(cancelAction);
        
        self.present(test, animated: true, completion: nil)
        
    }
    
    //5
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if (catSelected == "Canada") {
            return myProvinces[section];
            
        }else{ //USA
            return myProvincesUsa[section]
            
        }
        
        //return myProvinces[section]
        
    }



}
