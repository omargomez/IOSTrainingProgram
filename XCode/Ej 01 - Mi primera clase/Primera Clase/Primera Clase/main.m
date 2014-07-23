/**
 
 En este ejercicio se debe pasar una clase (no importa su nombre).
 Lo importante es que tenga un metodo llamado "holaMundo"
 
 */

#import <Foundation/Foundation.h>

static void primera_clase( id obj ); 
static void funciona_con_string( id obj );

void funciona_con_string( id obj )
{
    
    SEL selector = @selector(length);
    
    if ( ![obj respondsToSelector: selector] ) {
        NSLog(@"El objeto no tiene el método 'length'!");
        return;
    }
    
    NSUInteger l = [obj length];
    NSLog(@"l: %lu", l);
    
}

void primera_clase( id obj )
{
    // Tiene el método holaMundo?
    SEL selector = @selector(holaMundo);
    
    if ( ![obj respondsToSelector: selector] ) {
        NSLog(@"El objeto no tiene el método 'holaMundo'!");
        return;
    }
    
    [obj performSelector:selector];    
    
}


int main (int argc, const char * argv[])
{

    @autoreleasepool {
        funciona_con_string( [[NSNumber numberWithInt:20] stringValue] );
        // insert code here...
        primera_clase( nil );
        
    }
    return 0;
}

