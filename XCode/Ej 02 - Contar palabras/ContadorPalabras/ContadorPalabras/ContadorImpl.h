//
//  ContadorPalabras.h
//  ContadorPalabras
//
//  Created by Omar Gomez on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContadorPalabrasProt.h"

@interface ContadorImpl : NSObject <ContadorPalabrasProt>
{
    int numPalabras;
}


@end
