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
    
    let queue = DispatchQueue(label: "myQueue", qos: .userInteractive, attributes: .concurrent)
        
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
    
    @IBAction func passwordGenerate(_ sender: UIButton) {
        let chars = String().printable
        let random = String((0..<3).compactMap{ _ in chars.randomElement() })
        textField.text = random
        
        queue.async {
            self.bruteForce(passwordToUnlock: random)
        }
    }
    
    func bruteForce(passwordToUnlock: String) {
        DispatchQueue.main.async {
            self.indicator.isHidden = false
            self.indicator.startAnimating()
        }
        let ALLOWED_CHARACTERS:   [String] = String().printable.map { String($0) }

        var password: String = ""

        while password != passwordToUnlock {
            password = generateBruteForce(password, fromArray: ALLOWED_CHARACTERS)
        }
        
        DispatchQueue.main.async {
            self.indicator.stopAnimating()
            self.indicator.isHidden = true
            self.label.text = password
            self.textField.isSecureTextEntry = true
        }
            
        print(password)
    }
    
    func configure() {
        textField?.isSecureTextEntry = false
        
        indicator.isHidden = true
        
        label?.textAlignment = .center
        label?.text = "Password is ..."
        
        colorButton?.setTitle("Change color", for: .normal)
        
        passwordButton?.setTitle("Selection password", for: .normal)
    }
//  MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}


