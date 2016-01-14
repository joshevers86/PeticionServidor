//
//  ViewController.swift
//  PeticionServidor
//
//  Created by Jose Navarro Alabarta on 13/1/16.
//  Copyright © 2016 ai2-upv. All rights reserved.
//


/*
echo "# PeticionServidor" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/joshevers86/PeticionServidor.git
git push -u origin master
*/


/*
Es especialmente importante enviar esta tarea antes de la fecha límite, enero 17, 11:59 PM PT, porque deben ser calificada por otras personas Si envías tarde, es posible que no haya suficientes compañeros cerca para revisar tu trabajo. Esto hace que resulte difícil, y en algunos casos imposible, generar una calificación. Envía a tiempo para evitar estos riesgos.

Instrucciones

En este entregable desarrollarás una aplicación usando Xcode que realice una petición a https://openlibrary.org/

Para ello deberás crear una interfaz de usuario, usando la herramienta Storyboard que contenga:

1. Una caja de texto para capturar el ISBN del libro a buscar
2. El botón de "enter" del teclado del dispositivo deberá ser del tipo de búsqueda ("Search")
3. El botón de limpiar ("clear") deberá estar siempre presente
4. Una vista texto (Text View) para mostrar el resultado de la petición
Un ejemplo de URL para acceder a un libro es:

https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:978-84-376-0494-7

Su programa deberá sustituir el último código de la URL anterior (en este caso 978-84-376-0494-7) por lo que se ponga en la caja de texto.

Al momento de presionar buscar en el teclado, se deberá mostrar los datos crudos (sin procesar) producto de la consulta en la vista texto en concordancia con el ISBN que se ingreso en la caja de texto

En caso de error (problemas con Internet), se deberá mostrar una alerta indicando esta situación

Sube tu solución a GitHub e ingresa la URL en el campo correspondiente



*/

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var boton: UIButton!
    @IBOutlet weak var aaaa: UILabel!
    @IBOutlet weak var resultado: UILabel!
    @IBOutlet weak var cISBN: UITextField!
    var rest : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        cISBN.delegate = self
        boton.enabled = false
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //self.cISBN.
    }
    
    func asincrono(isbn: String){
        //bloque no bloqueante
        let link = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:\(isbn)"
        let url = NSURL(string: link) // conversion de la string a formato url
        let datos = NSData(contentsOfURL: url!) // se realiza la peticion al servidor
        let texto = NSString(data: datos!, encoding: NSUTF8StringEncoding) //datos obtenidos en el formato UTF8
        
        if texto != nil {
            print(texto!)
            resultado.textColor = UIColor.greenColor()
            resultado.text = "Recurso Disponible"
            rest = "\(texto!)"
            boton.enabled = true
        }else {
            resultado.textColor = UIColor.redColor()
            resultado.text = "Recurso NO Disponible"
        }
        
        /*
        resultado.text = link
        print(link)
        let url = NSURL(string: link) // conversion de la string a formato url
        let sesion = NSURLSession.sharedSession() //se emplea sesion compartida, con esto se libera el cliente hasta que el servidor ha resuelto la peticion
         let bloque = { (datos : NSData?, resp: NSURLResponse?, error : NSError?) -> Void in
            let texto = NSString(data: datos!, encoding: NSUTF8StringEncoding)
            print(texto!)
            
            //self.rest = texto! as String
        } // cuando el servidor a terminado de procesar la peticion, el cliente recibe la respuesta del servidor y los convierte en UTF8
        let dt = sesion.dataTaskWithURL(url!, completionHandler: bloque)   //se crea una tarea para esa sesion, y ejecuta el bloque una vez ha recibido los datos del servidor
        dt.resume()
        print("se imprime antes de la peticion")*/
    }
 
    func textFieldShouldReturn(cISBN: UITextField) -> Bool {
        
        cISBN.resignFirstResponder()
        asincrono(cISBN.text!)
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        /*let sel = mosSelPizza.text!
        let sigVista = segue.destinationViewController as! TipoMasa
        sigVista.tamPizza = sel*/
        let res:String = rest
        let sigVista = segue.destinationViewController as! Respuesta
        sigVista.te  = res
    }
    

    
    
}

