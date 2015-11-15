//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Martin Salcedo on 27/10/15.
//  Copyright © 2015 ejemplo. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    //Mark: Propiedades
    
    var calificacion = 0
    var ratingBoton = [UIButton]()
    var spacing = 5
    var stars = 5
    var rating = 0{
        didSet{
            setNeedsLayout()
        }
    }

    //Mark: Inicializacion
    
    //para anular la inicializacion 
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        
        for _ in 0..<stars {
            //declara un boton
//            let botonRojo = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
            let botonRojo = UIButton()
            
            //asignar la imagen al boton
            botonRojo.setImage(emptyStarImage, forState: .Normal)
            botonRojo.setImage(filledStarImage, forState: .Selected)
            botonRojo.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            //se le asigna el color rojo al boton
//            botonRojo.backgroundColor = UIColor.redColor()
            botonRojo.adjustsImageWhenHighlighted = false
            
            //Se define (self) por que se esta llamando de esta clase
            //linea para hacer la conexion con la funcion que se define en esta clase.
            //(TouchDown) se ejecuta cada vez que se presiona el boton
            botonRojo.addTarget(self, action: "RatingTapped:", forControlEvents: .TouchDown)
            
            ratingBoton += [botonRojo]
            //se le agrega el boton a la vista que se creo anteriormente
            addSubview(botonRojo)
        }
        
    }
    //crea un marco, para iterar sobre todos los marcos
    override func layoutSubviews() {
        
        //declaracion de una constante
        let botonSize = Int(frame.size.height)
        
        var botonFrame = CGRect(x: 0, y: 0, width: botonSize, height: botonSize)
        // Desplazamiento de origen de cada botón por la longitud del botón más espaciado.
        for (index, button) in ratingBoton.enumerate() {
            botonFrame.origin.x = CGFloat(index * (botonSize + 5))
            button.frame = botonFrame
        }
        UpdateButtonSelectionState()
    }
    
    //funcion para anular el tamaño intriseco del boton
    override func intrinsicContentSize() -> CGSize {
        let botonSize = Int(frame.size.height)
        let width = (botonSize + spacing) * stars
        
        return CGSize(width:width, height:botonSize)
    }
    //Mark: Accion
    
    func RatingTapped(botonrojo: UIButton){
        rating = ratingBoton.indexOf(botonrojo)! + 1
        print("boton Presionado")
        UpdateButtonSelectionState()
    }
    
    func UpdateButtonSelectionState(){
        for(index, button) in ratingBoton.enumerate(){
            button.selected = index < rating
            
        }
    }

}
