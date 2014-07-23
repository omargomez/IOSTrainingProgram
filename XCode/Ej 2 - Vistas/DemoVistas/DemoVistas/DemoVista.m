//
//  DemoVista.m
//  DemoVistas
//
//  Created by Omar Gomez on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DemoVista.h"

@implementation DemoVista

@synthesize contador;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSLog(@"Frame!");
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        contador = 0;
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    int next = contador % 8;
    CGContextSetLineWidth(context, 2.0);
    
    
    if (next == 0 ) {
        //Lineas
        CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
        
        CGContextMoveToPoint(context, 20, 20);
        CGContextAddLineToPoint(context, 100, 20);
        
        CGContextStrokePath(context);
    }
    else if ( next == 1 ) {
        //Reactangulos
        CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
        
        CGRect rectangle = CGRectMake(60,170,200,80);
        
        CGContextAddRect(context, rectangle);    
        CGContextStrokePath(context);    
    }
    else if ( next == 2 ) {
        //Figuras
        CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
        
        CGContextMoveToPoint(context, 100, 100);
        CGContextAddLineToPoint(context, 150, 150);
        CGContextAddLineToPoint(context, 100, 200);
        CGContextAddLineToPoint(context, 50, 150);
        CGContextAddLineToPoint(context, 100, 100);
        
        CGContextStrokePath(context);
    }
    else if ( next == 3 ) {
        //Elipses
        CGContextSetStrokeColorWithColor(context, [UIColor orangeColor].CGColor);
        
        CGRect rectElipse = CGRectMake(60,170,200,80);    
        CGContextAddEllipseInRect(context, rectElipse);    
        CGContextStrokePath(context);    
    }
    else if ( next == 4 ) {
        //Figuras llenas
        CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
        CGRect rectFill = CGRectMake(60,170,200,80);
        CGContextAddRect(context, rectFill);
        CGContextStrokePath(context);
        CGContextSetFillColorWithColor(context, [UIColor yellowColor].CGColor);
        CGContextFillRect(context, rectFill);    
        
    }
    else if ( next == 5 ) 
    {
        //Curvas
        CGContextSetStrokeColorWithColor(context, [UIColor cyanColor].CGColor);
        
        CGContextMoveToPoint(context, 100, 100);
        CGContextAddArcToPoint(context, 100,200, 300,200, 100);
        CGContextStrokePath(context);    
    }
    else if ( next == 6 ) 
    {
        //Texto
        CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
        NSString* string = @"Omar";
        [string drawAtPoint:CGPointMake(80, 80)
                   withFont:[UIFont systemFontOfSize:24]];
    }
    else if ( next == 7 ) {
        //Imágenes
        UIImage *myImage = [UIImage imageNamed:@"apple.png"];
        
        CGPoint imagePoint = CGPointMake(25, 25);
        
        [myImage drawAtPoint:imagePoint];
        
        [myImage release];        
    }
    
    
}    



@end
