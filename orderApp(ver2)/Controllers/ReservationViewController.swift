//
//  ReservationViewController.swift
//  orderApp(ver2)
//
//  Created by Роза Шархмуллина on 11.05.23.
//

import UIKit

class ReservationViewController: UIViewController {
    
    @IBOutlet weak var quantityOfGuests: UITextField!
    
    @IBOutlet weak var dateOfReservation: UIDatePicker!
    
    @IBOutlet weak var paymentSwitch: UISwitch!
    
    @IBOutlet weak var reserveButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reserveButton.isEnabled = false
        self.paymentSwitch.addTarget(self, action: #selector(buttonObserver), for: .valueChanged)

        // Do any additional setup after loading the view.
    }
    @objc private func buttonObserver(switch: UISwitch) {
        if paymentSwitch.isOn {
            reserveButton.isEnabled = true
        } else {
            reserveButton.isEnabled = false
        }
    }
    

    @IBAction func reserveButtonAcrion(_ sender: Any) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
  
}
