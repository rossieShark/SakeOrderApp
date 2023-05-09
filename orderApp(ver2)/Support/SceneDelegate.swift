//
//  SceneDelegate.swift
//  orderApp(ver2)
//
//  Created by Роза Шархмуллина on 08.05.23.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        //guard let _ = (scene as? UIWindowScene) else { return }
        checkAuthentication()
        
        
    }
    
    func checkAuthentication()  {
        
        
        //SET INITIAL CONTROLLER
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var initialViewController: UIViewController
        let userDefaults = UserDefaults.standard
        if Auth.auth().currentUser == nil {
            // if already logged in then redirect to MainViewController
            
            initialViewController = mainStoryboard.instantiateViewController(withIdentifier: "MainViewController") as! LoginViewController // 'MainController' is the storyboard id of MainViewController
        } else {
            //If not logged in then show LoginViewController
            initialViewController = mainStoryboard.instantiateViewController(withIdentifier: "HomeController") as! HomeViewController// 'LoginController' is the storyboard id of LoginViewController
            
        }
        self.window?.rootViewController = initialViewController
        self.window?.makeKeyAndVisible()
        print(initialViewController)
        
    }
    
}
