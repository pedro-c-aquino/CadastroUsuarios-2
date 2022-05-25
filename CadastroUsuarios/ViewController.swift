//
//  ViewController.swift
//  CadastroUsuarios
//
//  Created by user208023 on 4/28/22.
//

import UIKit

class ViewController: UIViewController {
    
    var usuarioList: [Usuario] = []
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var senhaTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        print(self.usuarioList)
        let email = emailTextField.text ?? ""
        let senha = senhaTextField.text ?? ""
        
        for usuario in usuarioList {
            if usuario.email == email {
                if usuario.senha == senha {
                    self.performSegue(withIdentifier: "telaTableView", sender: nil)
                }
                else {
                    let alert = UIAlertController(title: "Senha Incorreta", message: "Senha Incorreta! Tente novamente.", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Ok", style: .default))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        let alert = UIAlertController(title: "Usuário não cadastrado", message: "Usuário não cadastrado. Cadastre-se", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func cadastreseButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "telaCadastrese", sender: nil)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "telaCadastrese"

        {

            let vc = segue.destination as? TelaCadastro
            vc?.delegate = self

        }

        else

        {

            let vc = segue.destination as? TelaTableView
            vc?.userList = self.usuarioList

        }
    }
}

extension ViewController: TelaCadastroProtocol {
    func registerUser(value: Usuario) {
        
        if self.usuarioList.count == 0
        
        {
            
            
            self.usuarioList.append(value)
            
            dismiss(animated: true, completion: nil)
            
            let alert = UIAlertController(title: "Parabéns", message: "Usuário cadastrado com sucesso!", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true, completion: nil)
        
        }
        
        for usuario in self.usuarioList {
            
            if value.email == usuario.email
            {
                
                dismiss(animated: true, completion: nil)
                
                let alert = UIAlertController(title: "Usuário já cadastrado", message: "Este usuário já está cadastrado. Dirija-se à tela de login.", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Ok", style: .default))
                self.present(alert, animated: true, completion: nil)
            }
            
            else
            
            {
                self.usuarioList.append(value)
                
                dismiss(animated: true, completion: nil)
                
                let alert = UIAlertController(title: "Parabéns", message: "Usuário cadastrado com sucesso!", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Ok", style: .default))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
}

