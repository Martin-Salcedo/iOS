//
//  ViewController.swift
//  FoodTracker
//
//  Created by Martin Salcedo on 13/10/15.
//  Copyright © 2015 ejemplo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate,
    UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //Mark: Propiedades
    //el weak indica que la propiedad puede que tenga o no tenga valor en el ciclo de vida de la aplicacion
   
    @IBOutlet weak var nombreTextField: UITextField!
    
    //(!) se envuelve el valor de la varible y el cual es una forma implicita de indicar que tiene un tipo de valor
    
    @IBOutlet var comidaLabel: UILabel!
    
    //Conexion del uiimagen del historyboard con el Controlador
    @IBOutlet weak var imagenPhotoView: UIImageView!
    
    //rating o calificacion
    @IBOutlet var ratingControl: RatingControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nombreTextField.delegate = self//protocolo delegado
        //se utiliza self, para hacer referencia a la misma clase de viewe controller
    }
    
    //Mark: UITextField Delegate
    
    //funciones para ocultar el teclado
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        comidaLabel.text = textField.text
    }
    // fin de las funciones de ocultar teclado
    
    // MARCA: UIImagePickerControllerDelegate
    
    //en caso de que el usuario cancele la accion de seleccionar la imagen
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // para poder manejar la imagen seleccionada por el usuario
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let SelectImage = info [UIImagePickerControllerOriginalImage] as! UIImage
        
        imagenPhotoView.image = SelectImage
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
   // Marca: Acciones
    
    @IBAction func seleccionaImagenDesdeLibreria(sender: UITapGestureRecognizer) {
        //oculta el teclado cuando selecciona la imagen
        nombreTextField.resignFirstResponder()
        
        //UIImagenPickerCotroller permite al usuario elegir una imagen de sus dispositivo (biblioteca de fotos)
        let imagenPickerController = UIImagePickerController()
        
        //solo permite obtener fotos del carrte o galeria del dispositivo, (no tomar fotos)
        imagenPickerController.sourceType = .PhotoLibrary
        
        //asegura cuando el ususrio toma una imagen
        imagenPickerController.delegate = self
        
        
        presentViewController(imagenPickerController, animated: true, completion: nil)
    }

/*    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        
        
    }
  */  
}

