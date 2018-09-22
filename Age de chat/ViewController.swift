//
//  ViewController.swift
//  Age de chat
//
//  Created by Kevin Trebossen on 22/09/18.
//  Copyright © 2018 KTD. All rights reserved.
//

import UIKit
import AVFoundation                 // audio and video Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func calculerAction(_ sender: Any) {     // --------- Code quand bouton appuyé --------- //
        
        view.endEditing(true)           // Ranger le clavier
        
        // Vérifier que l'utilisateur à rentrer du texte
        if ageTextField.text != nil {
            let texte = ageTextField.text!
            if let nombreEntier = Int(texte) {
                let ageDeChat = nombreEntier * 7
                resultLabel.text = "Votre âge de chat est de : \(ageDeChat)"
            }
        }
    }
    
    @IBAction func soundAction(_ sender: Any) {    //  ---------  Faire parler l'app  --------- //
        if let texte = resultLabel.text {                       // Est-ce qu'on a récupéré un texte dans la résultat
            let speech = AVSpeechSynthesizer()                  // Permet de synthétiser une voix
            let utterance = AVSpeechUtterance(string: texte)    // utérance
            utterance.rate = 0.5                                // vitesse à laquelle la voix va parler -->  0 = lent || 1 = rapide
            utterance.voice = AVSpeechSynthesisVoice(language: "fr_FR") // Voix
            speech.speak(utterance)
        }
    }
    
    
    
}

