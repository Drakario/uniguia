    //
//  eventos.swift
//  uniguia
//
//  Created by student on 03/06/19.
//  Copyright © 2019 student. All rights reserved.
//

import Foundation
    class Evento {

        let nome: String
        let horario: String
        
        
        init(nome: String, horario: String) {
            self.nome = nome
            self.horario = horario
    
        }
        
    }
    
 
    class EventoDAO {
        
        static func getList() -> [Evento] {
            return [
                Evento(nome: "Reuniao", horario: "12:12"),
                Evento(nome: "Palestra nati", horario: "12:12"),
                Evento(nome: "Palestra CCT", horario: "12:12"),
                Evento(nome: "Palestra CCS", horario: "12:12"),
                Evento(nome: "APAPORRA", horario: "12:12")
            ]
        }
        
    }
