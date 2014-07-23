//
//  main.m
//  Ej 00 uso_metodos
//
//  Created by Omar Gómez on 6/13/14.
//  Copyright (c) 2014 Omar Gomez. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        //Ingresar a: http://goo.gl/WWrUr6
        // Para investigar los metodos solicitados
        
        NSString *cadena = @"Hola Mundo";
        
        NSInteger longitud = 0; // Asignar la longitud aqui
        NSLog(@"La longitud de la cadena es: %ld", longitud);
        
        unichar primer = '*'; // Asignar el primer caracter aqui
        NSLog(@"El primer caracter de la cadena es: %C", primer);
        
        unichar ultimo = '*'; // Asignar el ultimo caracter aqui
        NSLog(@"El ultimo caracter de la cadena es: %C", ultimo);
        
        NSString *mayusculas = nil; // Asignar la cadena en mayusculas
        NSLog(@"Cadena en mayusculas: %@", mayusculas);
        
        NSString *minusculas = nil; // Asignar la cadena en minusculas
        NSLog(@"Cadena en minuscukas: %@", minusculas);
        
        
    }
    return 0;
}

