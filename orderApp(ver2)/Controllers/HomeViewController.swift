//
//  HomeViewController.swift
//  orderApp(ver2)
//
//  Created by Роза Шархмуллина on 08.05.23.
//

import UIKit

class HomeViewController: UIViewController {
    
    let userDef = UserDefaults.standard

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var logOutButton: UIBarButtonItem!
    @IBOutlet weak var phoneNumberLabel: UITextField!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AuthService.shared.fetchUser { [weak self] user, error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showfetchingUserError(on: self, with: error)
                return
            }
            if let user = user {
                self.label.text = "こんにちは, \(user.username)"
            }
        }
        
        
        nameLabel.text = userDef.string(forKey: "name")
        phoneNumberLabel.text = userDef.string(forKey: "phoneNumber")
        addressLabel.text = userDef.string(forKey: "address")

        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveButtonAction(_ sender: Any) {
        userDef.setValue(nameLabel.text, forKey: "name")
        userDef.setValue(phoneNumberLabel.text, forKey: "phoneNumber")
        userDef.setValue(addressLabel.text, forKey: "address")
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func logOutButtonAction(_ sender: Any) {
        AuthService.shared.signOut { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showlogOutErrorAlert(on: self, with: error)
                return
            }
            if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                sceneDelegate.checkAuthentication()
                 
            }
        }
    }
}
