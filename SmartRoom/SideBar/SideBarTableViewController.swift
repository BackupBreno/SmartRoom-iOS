//
//  SideBarTableViewController.swift
//  SmartRoom
//
//  Created by Breno Aquino on 30/09/2017.
//  Copyright © 2017 Breno Aquino. All rights reserved.
//

import UIKit

class SideBarTableViewController: UITableViewController {

    var panelViewController: UINavigationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let controllerPanel = StoryboardScene.Main.panelViewControllerID.instantiate()
        
        self.panelViewController = UINavigationController(rootViewController: controllerPanel)
        
        self.panelViewController.navigationBar.prefersLargeTitles = true
        
        self.tableView.tableFooterView = UIView()
    }

    // MARK: - TableView Methods

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            
            self.slideMenuController()?.changeMainViewController(panelViewController, close: true)
            
        default:
            
            break
        }
    }
}
