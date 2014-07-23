//
//  main.m
//  ClasificarPalabras
//
//  Created by Omar Gomez on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClasificadorProt.h"

static void clasificar_palabras( const char *input, id<ClasificadorProt> clasificador )
{
    FILE *file = fopen ( input, "r" );
    if ( file != NULL )
    {
        char line [ 512 ]; 
        while ( fgets ( line, sizeof line, file ) != NULL ) /* read a line */
        {
            NSString *linea = [NSString stringWithCString:line encoding:NSUTF8StringEncoding];
            [clasificador procesarLinea: linea];
        }
        fclose  ( file );
        
        NSString *abc = @"abcdefghijklmnopqrstuvxyz";
        
        NSLog(@"Letra\t# Palabras");
        for ( int i = 0; i < [abc length]; i++ ) {
            unichar c = [abc characterAtIndex:i];
            int t = [clasificador obtenerCuentaPara:c];
            NSLog(@"%C\t%d", c, t);
        }
    }
    else
    {
        perror ( input ); 
    }        
    
    
}

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
    }
    return 0;
}

