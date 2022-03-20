//
//  ViewController.swift
//  AyalaErickPrac2
//
//  Created by Erick Ayala Delgadillo on 19/03/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtFrase: UITextField!
    @IBOutlet weak var titleApp: UILabel!
    @IBOutlet weak var txtViewFrases: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var txtAlpha: UILabel!
    
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var slideBoton: UISlider!
    @IBOutlet weak var switchBoton: UISwitch!
    @IBOutlet weak var btnDeshability: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleApp.font = UIFont(name: "CAVEMAN", size: 20)
        imageView?.alpha = 0.50
    }

    @IBAction func btnAgregaFrase(_ sender: UIButton) {
        guard let frase = txtFrase.text else { return }
        var mensaje = ""
        
        if frase == "" {
            mensaje = "Por favor, debe ingresar una frase"
        }
        else {
            //
        }
        
        if mensaje == "" {
            txtViewFrases.text += "\n" + frase
            txtFrase.text = ""
        }
        else{
            let alert = UIAlertController(title: "Error",  message: mensaje, preferredStyle: .alert)
            let action = UIAlertAction(title: "Entiendo", style: .default)
            alert.addAction(action)
            self.present(alert,animated: true, completion: nil )
        }
    }
    
    @IBAction func btnDeshabilitar(_ sender: UIButton) {
        
        guard let btnTxt = sender.titleLabel!.text else { return }
        
        // verificar el valor del texto del botón
        if btnTxt == "Deshabilitar" {
            txtFrase.isEnabled = false
            btnAdd.isEnabled = false
            switchBoton.isEnabled = false
            slideBoton.isEnabled = false
            btnDeshability.setTitle("Habilitar", for: .normal)
        }
        if btnTxt == "Habilitar" {
            txtFrase.isEnabled = true
            btnAdd.isEnabled = true
            switchBoton.isEnabled = true
            slideBoton.isEnabled = true
            btnDeshability.setTitle("Deshabilitar", for: .normal)
        }
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        if sender.isOn {
            imageView?.image = UIImage(named: "angel")
        }
        else {
            imageView?.image = UIImage(named: "demonio")
        }
    }
    
    
    @IBAction func slideAction(_ sender: UISlider) {
        imageView?.alpha = CGFloat(sender.value)
        txtAlpha?.text = "\((sender.value*100).rounded()/100)"
    }
}

