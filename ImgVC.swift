//
//  ImgVC.swift
//  English4Kids
//
//  Created by do duy hung on 14/09/2016.
//  Copyright © 2016 hoangdangtrung. All rights reserved.
//

import UIKit

class ImgVC: UIViewController{

    @IBOutlet weak var Image: UIImageView!
    
    var nameImage :String?
    override func viewDidLoad() {
        super.viewDidLoad()
        Image.image = UIImage(named: nameImage! )
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
