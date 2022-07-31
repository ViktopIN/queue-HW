//
//  View.swift
//  queue-HW
//
//  Created by Виктор on 31.07.2022.
//

import UIKit

class View: UIView {
//    MARK: - Properties
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var passwordButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var colorButton: UIButton!
//    MARK: - Initialize
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        textField.isSecureTextEntry = true
        
        label.textAlignment = .center
        label.text = "Password is ..."
        
        colorButton.titleLabel?.text = "Change color"
        
        passwordButton.titleLabel?.text = "Selection password"
    }

}
