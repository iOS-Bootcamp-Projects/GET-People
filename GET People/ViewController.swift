//
//  ViewController.swift
//  GET People
//
//  Created by Aamer Essa on 06/12/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var peopleTableList: UITableView!
    var people:People?
    var peopleList = [Person]()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        peopleTableList.delegate = self
        peopleTableList.dataSource = self
        
        let url = URL(string: "https://swapi.dev/api/people/?format=json")
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            let decoder = JSONDecoder()
            do{
                self.people = try decoder.decode(People.self, from: data!)
               // print(self.people)
                self.peopleList = self.people!.results
                DispatchQueue.main.async {
                    
                    self.peopleTableList.reloadData()
                }
              
            } catch{
                print("\(error)")
            }
        }
        
        dataTask.resume()
    }
}


extension ViewController:UITableViewDataSource,UITableViewDelegate{
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return peopleList.count
}

 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
   
        
     cell.textLabel?.text = self.peopleList[indexPath.row].name
        
        
    
    return cell
}
}
