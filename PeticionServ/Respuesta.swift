//
//  Respuesta.swift
//  PeticionServ
//
//  Created by Jose Navarro Alabarta on 14/1/16.
//  Copyright © 2016 ai2-upv. All rights reserved.
//

import Foundation
import UIKit

class Respuesta: UIViewController {
    
    @IBOutlet weak var s: UILabel!
    var te : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        s.text = te
    }
    
}


