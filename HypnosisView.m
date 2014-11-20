//
//  HypnosisView.m
//  Hypnosista
//
//  Created by Anastasia Boiko on 11/20/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView


- (void)drawRect:(CGRect)rect {
    CGRect bounds = self.bounds;
    
    // Figure out the center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    // The largest circle will circumscribe the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        
        [path addArcWithCenter:center
                        radius:currentRadius // Note this is currentRadius!
                    startAngle:0.0
                      endAngle:M_PI * 2.0
                     clockwise:YES];
    }
    
    // Set line width to 10 points
    path.lineWidth = 10;
    
    // Set the drawing color to light gray
    [[UIColor lightGrayColor] setStroke];
    
    // Drawing the line
    [path stroke];
    
    UIImage *catImage = [UIImage imageNamed:@"cat_png.png"];
    
    [catImage drawInRect:CGRectMake(130, 130, 130, 130) ];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // All HypnosisViews start with a clear background color
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


@end
