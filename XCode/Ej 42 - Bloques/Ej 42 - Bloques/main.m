//
//  main.m
//  Ej 42 - Bloques
//
//  Created by Omar Gomez on 4/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

static void hacer_algo_con( int i, NSString *s, id (^b)( int, id ) ) 
{
    NSLog(@"i: %d", i );
    NSLog(@"s: %@", s );
    NSLog(@"b: %@", b( i, s) );
}

static void ordenar() 
{
    NSArray *arr = [NSArray arrayWithObjects:
                           @"7", @"1", @"7", @"2", @"0", @"8", @"7", @"3",  
                           nil];
    NSArray *sorted = [arr sortedArrayUsingComparator: (NSComparator)^(id obj1, id obj2){
#if 0        
        int i1 = [obj1 intValue];
        int i2 = [obj2 intValue];
        
        if (i1 < i2)
            return NSOrderedAscending;
        else if (i1 > i2)
            return NSOrderedDescending;
        
        return NSOrderedSame;
#endif
        return [obj1 compare:obj2];
    }];
    
    NSLog(@"%@", sorted );
}

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        hacer_algo_con( 
            10, 
            @"Hola", 
            ^(int i, id obj){
                return [NSString stringWithFormat:@"< %d, %@ >", i, obj ];
            } 
        );
        
        ordenar();
        
    }
    return 0;
}

