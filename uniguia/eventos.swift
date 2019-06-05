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
        
        
        init(nome: String, horario: String = "") {
            self.nome = nome
            self.horario = horario
    
        }
        
    }
    
    
    /*
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
     */
    
    
    class EventoDAO {
        
        static func getEventos (callback: @escaping ((Evento) -> Void)) {
            
            let endpoint: String = "https://uniguia.mybluemix.net/events"
            
            guard let url = URL(string: endpoint) else {
                print("Erroooo: Cannot create URL")
                return
            }
            
            let urlRequest = URLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
                
                if error != nil {
                    print("Error = \(String(describing: error))")
                    return
                }
                
                let responseString = String(data: data!, encoding: String.Encoding.utf8)
                print("responseString = \(String(describing: responseString))")
                
                DispatchQueue.main.async() {
                    do {
                        if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [[String: AnyObject]] {
                            
                            let evento = Evento(nome: json[0]["title"] as! String)
                            
                            let nomeEvento = evento.nome
                            let nomeHorario = evento.horario
                            
                            print("\(nomeEvento) realizado em \(nomeHorario).")
                            
                            callback(evento)
                            
                        }else {
                            
                            print("fudeuuuu")
                        }
                    } catch let error as NSError {
                        print("Error = \(error.localizedDescription)")
                    }
                }
                
                
            })
            
            task.resume()
        }
    }
