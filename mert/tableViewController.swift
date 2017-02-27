//
//  tableViewController.swift
//  mert
//
//  Created by Beykoz1 on 27.02.2017.
//  Copyright © 2017 Beykoz1. All rights reserved.
//

import UIKit

class tableViewController: UIViewController, UITableViewDelegate , UITableViewDataSource, UISearchBarDelegate{

    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    @IBOutlet weak var table: UITableView!
    let array = ["furkan" , "elma" , "armut" , "portakal"]
    let reusable = "TableViewCell"
    var filteredArray : [String] = []
    var dicArray = [Dictionary<String,Any>()]
    let dic:[String : Any] = ["name" : "mert", "age" : "20", "lectures" : ["ios" , "android"]]
    let dic2:[String : Any] = ["name" : "eren", "age" : "19", "lectures" : ["unity" , "android"]]
    let dic3:[String : Any] = ["name" : "furkan", "age" : "18", "lectures" : ["ios" , "nesne"]]
    
    
    
    override func viewDidLoad() {
        dicArray.append(dic)
        dicArray.append(dic2)
        dicArray.append(dic3)
        
        filteredArray = array
        let nib:UINib = UINib.init(nibName: reusable, bundle: nil)
        table.register(nib, forCellReuseIdentifier: reusable)
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredArray = []
        for item in array {
            if item.contains(searchText.lowercased()) {
                filteredArray.append(item)
                
            }
        }
        if filteredArray.isEmpty && searchText == "" {
            filteredArray = array
        }
        table.reloadData()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return  filteredArray.count
        return dicArray.count-1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: reusable, for:indexPath) as! TableViewCell
       /* cell.label.text = filteredArray[indexPath.row]
        cell.foto.image = UIImage.init(named: filteredArray[indexPath.row])
        return cell*/
        let name = dicArray[indexPath.row+1]["name"] as! String
        let age = dicArray[indexPath.row+1]["age"]    as! String
        let lectures = dicArray[indexPath.row+1]["lectures"]
        
        var str = ""
        str.append(name)
        str.append(age)
        for item in lectures as! Array<Any> {
            str.append(item as! String)
        }
        cell.label.text = str
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showMessage", sender: filteredArray[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! messageViewController
        controller.isim = sender as! String
    }
   
}
