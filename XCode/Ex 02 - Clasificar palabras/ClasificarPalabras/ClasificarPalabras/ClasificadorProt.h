//
//  ClasificadorProt.h
//  ClasificarPalabras
//
//  Created by Omar Gomez on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ClasificadorProt <NSObject>

-(void)procesarLinea:(NSString *) linea;
-(int) obtenerCuentaPara:(unichar) caracter;

@end
