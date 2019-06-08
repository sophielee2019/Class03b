//
//  ViewController.swift
//  Class03b
//
//  Created by sophie on 2019/4/22.
//  Copyright © 2019 sophie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var MessageA: UILabel!
    
    // @IBOutlet weak var btnMapClicked: UIButton!
    /*
     @IBAction func btnMapClicked(_ sender: UIButton) {
        self.performSegue(withIdentifier: "moveToMapSegue", sender: self)
    }
     */
    
    @IBAction func btnBClicked(_ sender: Any) {
        
        // performSegue(withIdentifier: "moveToImageSegue", sender: self)
        
        let alert = UIAlertController(title: "資訊", message: "YN", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "YES", style: .default, handler: {action in
        
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "moveToImageSegue", sender: self)
            }
        })
        
        alert.addAction(okAction)
        
        
        present(alert, animated: true, completion: nil)
    }
    @IBAction func Click(_ sender: UIButton) {
        MessageA.text = "Hi, Xcode"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // print( "\( UserDefaults.standard.string(forKey: "hi")! )" )
        
        let worker : FileWorker = FileWorker()
        
        worker.writeToFile(content: "中文", fileName: "info.txt", tag: 0)
        
        let result : String = worker.readFromFile(fileName: "info.txt", tag: 0)
        
        print(result)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "moveToImageSegue"){
            let vc = segue.destination as! ImageViewController
            vc.display = "Hi"
        }
    }

}

