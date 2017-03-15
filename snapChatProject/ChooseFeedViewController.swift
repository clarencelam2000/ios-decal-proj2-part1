//
//  ChooseFeedViewController.swift
//  snapChatProject
//
//  Created by Clarence Lam on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class ChooseFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var labelChosenFeed: UILabel!
    @IBOutlet weak var chooseFeedTableView: UITableView!
    var chosenImage = UIImage()
    var chosenFeed = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chooseFeedTableView.delegate = self
        chooseFeedTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chooseFeedCell", for: indexPath) as! ChooseFeedViewCell
        let threadName = threadNames[indexPath.item]
        cell.chooseFeedName.text = threadName
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threads.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenFeed = threadNames[indexPath.item]
        labelChosenFeed.text = chosenFeed
    }
    
    @IBAction func postButtonTapped(_ sender: UIButton) {
        
        threads[chosenFeed]?.append(chosenImage)
        
        let alert = UIAlertController(title: "Posted!", message: "Snap posted to " + chosenFeed, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
            (_)in
            self.performSegue(withIdentifier: "unwindToImagePicker", sender: self)
        })
        
        alert.addAction(OKAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "unwindToImagePicker" {
                if let dest = segue.destination as? ImagePickerController {
                    
                }
            }
        }
    }*/

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
