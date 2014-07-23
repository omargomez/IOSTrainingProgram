#include <stdio.h>

//
//  main.m
//  ContadorPalabras
//
//  Created by Omar Gomez on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContadorImpl.h"
#import "ContadorPalabrasProt.h"

static void contar_palabras( const char *arch, id<ContadorPalabrasProt> contador )
{
    FILE *file = fopen ( arch, "r" );
    if ( file != NULL )
    {
        char line [ 512 ]; 
        while ( fgets ( line, sizeof line, file ) != NULL ) /* read a line */
        {
            NSString *linea = [NSString stringWithCString:line encoding:NSUTF8StringEncoding];
            [contador procesarLinea: linea];
        }
        fclose ( file );
        
        NSLog(@"El numero de palabras encontradas es: %d", [contador obtenerPalabras]);
    }
    else
    {
        perror ( arch ); 
    }        
    
}

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        ContadorImpl *contador = [[[ContadorImpl alloc] init] autorelease];
        
        const char *fname = "/Users/omarin/Documents/FCV/iOS classroom exercices/Ej 02 - Contar Palabras/ContadorPalabras/input.txt";
        contar_palabras(fname, contador);
        
    }
    return 0;
}

