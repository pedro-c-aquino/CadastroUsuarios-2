//
//  TelaCadastro.swift
//  CadastroUsuarios
//
//  Created by user208023 on 4/29/22.
//

import UIKit

protocol TelaCadastroProtocol: AnyObject {
    func registerUser(value: Usuario)
}

class TelaCadastro: UIViewController {
    
    weak var delegate: TelaCadastroProtocol?
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func singupButton(_ sender: UIButton) {
        let name = nameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let age = Int(ageTextField.text ?? "") ?? 0
        let phone = phoneTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        let usuario = Usuario(name: name, lastName: lastName, age: age, phone: phone, email: email, senha: password)
        
        self.delegate?.registerUser(value: usuario)

    }
    
}
