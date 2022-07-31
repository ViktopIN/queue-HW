//
//  ViewController.swift
//  queue-HW
//
//  Created by Виктор on 30.07.2022.
//

import UIKit

class ViewController: UIViewController {
//  MARK: - Properties
    
    @IBOutlet weak var colorButton: UIButton!
    @IBOutlet weak var passwordButton: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
        
    var isBlack: Bool = false {
        didSet {
            if isBlack {
                self.view.backgroundColor = .black
                self.label.textColor = .white
                self.indicator.color = .white
            } else {
                self.view.backgroundColor = .white
                self.label.textColor = .black
                self.indicator.color = .gray
                }
        }
    }
//  MARK: - Methods
  
    @IBAction func onBut(_ sender: UIButton) {
        isBlack.toggle()
    }
    
    func bruteForce(passwordToUnlock: String) {
        let ALLOWED_CHARACTERS:   [String] = String().printable.map { String($0) }

        var password: String = ""

        // Will strangely ends at 0000 instead of ~~~
        while password != passwordToUnlock { // Increase MAXIMUM_PASSWORD_SIZE value for more
            password = generateBruteForce(password, fromArray: ALLOWED_CHARACTERS)
//             Your stuff here
            print(password)
            // Your stuff here
        }
            
        print(password)
    }
    
    func configure() {
        textField?.isSecureTextEntry = true
        
        label?.textAlignment = .center
        label?.text = "Password is ..."
        
        colorButton?.setTitle("Change color", for: .normal)
        
        passwordButton?.setTitle("Selection password", for: .normal)
    }
//  MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
//        self.bruteForce(passwordToUnlock: "1!gr")
    }
}


