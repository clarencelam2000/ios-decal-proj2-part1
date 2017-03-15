//
//  OpenedImageController.swift
//  snapChatProject
//
//  Created by Clarence Lam on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class OpenedImageController: UIViewController {

    var selectedImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        openedImage.image = selectedImage
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var openedImage: UIImageView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func viewButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "imageToFeed", sender: self)
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
