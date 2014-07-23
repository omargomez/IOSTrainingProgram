//
//  ContadorPalabrasProt.h
//  ContadorPalabras
//
//  Created by Omar Gomez on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ContadorPalabrasProt <NSObject>

-(void) procesarLinea:(NSString *) lin;
-(int) obtenerPalabras;

@end
