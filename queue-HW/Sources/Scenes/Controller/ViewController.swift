//
//  ViewController.swift
//  queue-HW
//
//  Created by Виктор on 30.07.2022.
//

import UIKit

class ViewController: UIViewController {
//  MARK: - Properties
    private var mainView: View? {
        guard isViewLoaded else { return nil }
        return view as? View
    }
        
    var isBlack: Bool = false {
        didSet {
            if isBlack {
                self.view.backgroundColor = .black
            } else {
                self.view.backgroundColor = .white
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
//  MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
            
        mainView?.textField.isSecureTextEntry = true
            
        self.bruteForce(passwordToUnlock: "1!gr")
    }
}


