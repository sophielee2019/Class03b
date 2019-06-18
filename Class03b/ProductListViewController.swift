//
//  ProductListViewController.swift
//  Class03b
//
//  Created by sophie on 2019/6/17.
//  Copyright © 2019 sophie. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return array.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : MyTableViewCell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier ) as! MyTableViewCell
        
        let title : String = array[indexPath.row]
        
        cell.updateContent(content: title)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        selectedContent = array[indexPath.row]
        
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "moveToDetailSegue", sender: self)
        }
        
    }
    
    var selectedContent : String?
    
    var array : [String]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        array = ["Aaaaaaaaaa Aaaaaaaaaa Aaaaaaaaaa Aaaaaaaaaa Aaaaaaaaaa", "Bbbbbbbbbb Bbbbbbbbbb Bbbbbbbbbb Bbbbbbbbbb Bbbbbbbbbb Bbbbbbbbbb Bbbbbbbbbb Bbbbbbbbbb Bbbbbbbbbb", "ccc", "ddd", "eee", "fff"]
        
        // array = ["Drag and drop. Arrange components within your user interface by simply dragging controls on the canvas. Click to open an inspector to select font, color, alignment, and other design options, and easily re-arrange controls with your cursor. Many of these visual editors are also available within the code editor, so you can use inspectors to discover new modifiers for each control, even if you prefer hand-coding parts of your interface. You can also drag controls from your library and drop them on the design canvas or directly on the code.Dynamic replacement. The Swift compiler and runtime are fully embedded throughout Xcode, so your app is constantly being built and run. The design canvas you see isn’t just an approximation of your user interface — it’s your live app. And Xcode can swap edited code directly in your live app with “dynamic replacement”, a new feature in Swift.Previews. You can now create one or many previews of any SwiftUI views to get sample data, and configure almost anything your users might see, such as large fonts, localizations, or Dark Mode. Previews can also display your UI in any device and any orientation.", "SwiftUI uses a declarative syntax so you can simply state what your user interface should do. For example, you can write that you want a list of items consisting of text fields, then describe alignment, font, and color for each field. Your code is simpler and easier to read than ever before, saving you time and maintenance.", "c"]
        
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if( segue.identifier == "moveToDetailSegue"){
            
            let destination = segue.destination as! DetailViewController
            
            destination.content = self.selectedContent
        }
        
    }

}
