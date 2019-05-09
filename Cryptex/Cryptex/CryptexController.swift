//
//  CryptexController.swift
//  Cryptex
//
//  Created by Jordan Davis on 5/8/19.
//  Copyright © 2019 Jordan Davis. All rights reserved.
//

import Foundation

class CryptexController {
   
    init() {
        randomCryptex()
    }
    
    private var cryptextes: [Cryptex] = [Cryptex(password: "panther", hint: "animal guardian of wakanda"), Cryptex(password: "hillman", hint:"Huxtable family Alma Mater"), Cryptex(password: "ironman", hint: "What are you trying to solve right now?")]
    
    var currentCryptex: Cryptex?
    
    func randomCryptex() {
        let randomCryptex = cryptextes.randomElement()
        currentCryptex = randomCryptex
    }

}
//    init() {
//        randomCryptex()
//    }
    
//    func createCryptex(withPassword password: String, withHint hint: String) {
//        let cryptex = Cryptex(password: password, hint: hint)
//
//        cryptexes.append(cryptex)
//
//        createCryptex(withPassword: "Panther", withHint: "Guardian spirit animal of Wakanda.")
//        createCryptex(withPassword: "Hillman", withHint: "Huxtable family Alma Mater")
//        createCryptex(withPassword: "Ironman", withHint: "Defeated Thanos")
//    }
//
//    func randomCryptex() {
//        guard let currentCryptex = cryptexes.randomElement() else { return }
//
//    }
//
//
//
//    //MARK: -Properties
//    var cryptexes: [Cryptex] = []
//    var currentCryptex = Cryptex
//

