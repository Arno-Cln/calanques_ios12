//
//  TableViewIntegreeController.swift
//  Les Calanques
//
//  Created by Arnaud Caillon on 14/02/2019.
//  Copyright © 2019 Arnaud Caillon. All rights reserved.
//

import UIKit

let segueID = "Detail"

class TableViewIntegreeController: UITableViewController {
    
    var calanques: [Calanque] = []
    var cellID = "CalanqueCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        calanques = CalanqueCollection().all()
        tableView.backgroundColor = UIColor.clear
        let bg = UIImageView(frame: view.bounds)
        bg.image = calanques[0].image
        bg.contentMode = .scaleAspectFill
        tableView.backgroundView = bg
        

        

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return calanques.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? CalanqueCell {
            cell.setupCell(calanques[indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
            
            let calanque = calanques[indexPath.row] // Configuration cellules.
            cell.textLabel?.text = calanque.nom
            cell.imageView?.image = calanque.image
            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150 // Hauteur des cellules.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: segueID, sender: calanques[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueID {
            if let vc = segue.destination as? DetailController{
                vc.calanqueRecue = sender as? Calanque
            }
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
