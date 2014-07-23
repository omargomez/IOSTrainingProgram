//
//  ContadorPalabras.m
//  ContadorPalabras
//
//  Created by Omar Gomez on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ContadorImpl.h"

@implementation ContadorImpl

- (id)init {
    self = [super init];
    if (self) {
        numPalabras = 0;
    }
    return self;
}

-(void) procesarLinea: (NSString *) linea
{
    NSArray *palabras = [linea componentsSeparatedByString:@" "];
    numPalabras += [palabras count];
}

-(int) obtenerPalabras
{
    return numPalabras;
}


@end
