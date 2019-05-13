//
//  MyWebViewController.swift
//  Class03b
//
//  Created by sophie on 2019/5/6.
//  Copyright © 2019 sophie. All rights reserved.
//

import UIKit
import WebKit

class MyWebViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var btnGoBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        myWebView.load(URLRequest(url: URL(string: "https://www.google.com")!))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisAppear(notificaton:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - TextField
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let accept = "abcdeABCDE";
        
        let cs = NSCharacterSet(charactersIn: accept).inverted
        
        let filters = string.components(separatedBy: cs).joined(separator: "")
        
        if (string != filters)
        {
            return false
        }
        
        let current = textField.text! as NSString
        
        let newString : NSString = current.replacingCharacters(in: range, with: string) as NSString
        
        return newString.length <= 10
    }
    
// MARK: - keyboard

    @objc func keyboardWillAppear(notification:NSNotification?) {
        print("keyboardWillApear")
        
        guard let frame = notification?.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
    //self.btnGoBottomConstraint.constant = 444;
    self.btnGoBottomConstraint.constant = frame.cgRectValue.height;
    }
    
    @objc func keyboardWillDisAppear(notificaton:NSNotification?) {
        print("keyboardWillDisAppear")
        
    self.btnGoBottomConstraint.constant = 44;    }
    
    
    /*
    // MARK: - keyboard
     


    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
