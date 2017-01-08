//
//  MainViewController.swift
//  myPoll
//
//  Created by iUS on 1/6/17.
//  Copyright © 2017 myPoll. All rights reserved.
//

import UIKit

protocol DrawerDelegate {
    func MenuItemSelected(_ index : Int32 )
}

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var menuItemsTable: UITableView!
    
    @IBOutlet weak var btnclosemenuOverlay: UIButton!
    
    var arrayMenuItems=[Dictionary<String,String>]()
    
    /* Btn tap to display menu items  */
    
    var drawerBtn: UIButton!
    
    /* Delegate of MainVC */
    
    var delegate : DrawerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuItemsTable.tableFooterView=UIView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updatearrayMenuItems()
    }
    
    func updatearrayMenuItems(){
        arrayMenuItems.append(["title": "Home"])
        arrayMenuItems.append(["title": "Play"])
        menuItemsTable.reloadData()
    }
    
    
    
   
    @IBAction func onMenuBtnClick(_ sender: UIButton!) {
        drawerBtn.tag = 0
        
        if (self.delegate != nil) {
            var index = Int32(sender.tag)
            if(sender == self.btnclosemenuOverlay){
                index = -1
            }
            delegate?.MenuItemSelected(index)
        }
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            self.view.removeFromSuperview()
            self.removeFromParentViewController()
        })

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellMenu", for:indexPath)
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.layoutMargins = UIEdgeInsets.zero
        cell.preservesSuperviewLayoutMargins = false
        cell.backgroundColor = UIColor.clear
        
       // let lblTitle : UILabel? = cell.contentView.viewWithTag(101) as? UILabel
//        let imgIcon : UIImageView = cell.contentView.viewWithTag(100) as! UIImageView
        
        let dict=arrayMenuItems[indexPath.row]
        print(dict)
      //  lblTitle?.text = arrayMenuItems[indexPath.row]["title"]!
       cell.textLabel?.text=dict["title"]
        
        return cell
}
    
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let btn = UIButton(type: UIButtonType.custom)
        btn.tag = indexPath.row
        self.onMenuBtnClick(btn)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMenuItems.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
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
