//
//  FeedViewController.swift
//  snapChatProject
//
//  Created by Clarence Lam on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var feedTableView: UITableView!
    
    var selectedImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedTableView.delegate = self
        feedTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedViewCell", for: indexPath) as! FeedViewCell
        cell.nameOfSender.text = "Clarence Lam"
        cell.timeSinceSent.text = "Sent 1 minute ago"
        if (cell.read) {
            cell.redImage.image = UIImage(named: "read")
        }
        else {
            cell.redImage.image = UIImage(named: "unread")
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return threadNames.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (threads[threadNames[section]]?.count)!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return threadNames[section]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //segue to image view
        let listOfImages = threads[threadNames[indexPath.section]]
        selectedImage = (listOfImages?[indexPath.row])!
        performSegue(withIdentifier: "feedToImage", sender: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        feedTableView.reloadData()
    }

    @IBAction func unwindToFeed(segue:UIStoryboardSegue){}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "feedToImage" {
                if let dest = segue.destination as? OpenedImageController {
                    dest.selectedImage = selectedImage
                }
            }
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    
}
