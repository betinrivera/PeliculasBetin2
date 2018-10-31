//
//  ViewController.swift
//  PeliculasBetin
//
//  Created by Alumno on 31/10/18.
//  Copyright © 2018 Alumno. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 133
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Datos.resultadosPeliculas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "cellResultadoPelicula") as! CeldaPeliculaController
        
        celda.lblTitulo.text = Datos.resultadosPeliculas[indexPath.row].titulo
        celda.lblAño.text =
            "\(Datos.resultadosPeliculas[indexPath.row].año)"
        
        return celda
    }
    

    @IBOutlet weak var txtFieldBuscar: UITextField!
    
    @IBOutlet weak var aiCargar: UIActivityIndicatorView!
    
    
    @IBAction func doTapBuscar(_ sender: Any) {
    }
    
    @IBOutlet weak var tvPeliculas: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request("https://omdbapi.com/?apikey=1d2750f9&s=godfather").responseJSON {
            response in
            
            Datos.resultadosPeliculas.removeAll()
            
            if let dictResponse = response.result.value as? NSDictionary {
                if let arrResultados = dictResponse.value(forKey: "Search") as? NSArray {
                    for resultado in arrResultados {
                    
                        if let dictResultado = resultado as? NSDictionary {
                            let nuevoResultado = Pelicula(diccionario: dictResultado)
                            Datos.resultadosPeliculas.append(nuevoResultado)
                        }
                        
                    }
                    self.tvPeliculas.reloadData()
                    
                }
            }
            
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

