//
//  Pelicula.swift
//  PeliculasBetin
//
//  Created by Alumno on 31/10/18.
//  Copyright © 2018 Alumno. All rights reserved.
//

import Foundation
import UIKit

class Pelicula {
    var titulo : String
    var año : Int
    var clasificacion : String?
    var genero : String?
    var director : String?
    
    init(titulo : String, año: Int) {
        self.titulo = titulo
        self.año = año
    }
    
    init (diccionario : NSDictionary) {
        titulo = ""
        año = 0
        if let valorTitulo = diccionario.value(forKey: "Title") as? String {
            titulo = valorTitulo
        }
        
        if let valorAño = diccionario.value(forKey: "Year") as? String {
            año = Int(valorAño)!
        }
    }
    
    
}
