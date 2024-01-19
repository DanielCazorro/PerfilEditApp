//
//  PerfilViewController.swift
//  PerfilEditApp
//
//  Created by Daniel Cazorro Frias  on 19/1/24.
//

import UIKit

class PerfilViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var navigationBackButton: UIButton!
    @IBOutlet weak var navigationCloseButton: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageButton: UIImageView!
    
    @IBOutlet weak var emailStackView: UIStackView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailCompleteLabel: UILabel!
    
    @IBOutlet weak var phoneStackView: UIStackView!
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var nameStackView: UIStackView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameCompleteLabel: UILabel!
    
    @IBOutlet weak var officeStackView: UIStackView!
    @IBOutlet weak var officeNameLabel: UILabel!
    @IBOutlet weak var officeNameCompleteLabel: UILabel!
    
    @IBOutlet weak var aboutMeStackView: UIStackView!
    @IBOutlet weak var aboutMeLabel: UILabel!
    
    @IBOutlet weak var aboutMeTextField: UITextField!
    
    @IBOutlet weak var updateButton: UIButton!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
