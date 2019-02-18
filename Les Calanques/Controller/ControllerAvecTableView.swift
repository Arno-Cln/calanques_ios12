//
//  ControllerAvecTableView.swift
//  Les Calanques
//
//  Created by Arnaud Caillon on 14/02/2019.
//  Copyright © 2019 Arnaud Caillon. All rights reserved.
//

import UIKit

class ControllerAvecTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var calanques: [Calanque] = []
    var cellID = "Alternative"
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        calanques = CalanqueCollection().all()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calanques.count // Determine le nombre total de cellules.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let calanque = calanques[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            as? CalanqueCellAlternative {
        cell.calanque = calanque
        return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200 // Hauteur des cellules
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: segueID, sender: calanques[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueID, let vc = segue.destination as? DetailController {
            vc .calanqueRecue = sender as? Calanque
            
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            calanques.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } /* else if editingStyle == .insert {
         print("je pourrais eventuellement ajouter un élément")
         // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
         }   */
    }
    
    @IBAction func reloadAction(_ sender: Any) {
        calanques = CalanqueCollection().all()
        tableView.reloadData()
    }
    
 

}
