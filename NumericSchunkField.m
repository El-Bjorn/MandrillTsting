//
//  NumericSchunkField.m
//  SchunkApp
//
//  Created by BjornC on 8/27/13.
//  Copyright (c) 2013 Dmitri Salcedo. All rights reserved.
//

#import "NumericSchunkField.h"

@implementation NumericSchunkField

-(void) commonInit {
    self.keyboardType = UIKeyboardTypeDecimalPad;
}

// called from nib/storyboard
-(id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self){
        [self commonInit];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}



-(double) numValue {
    return [self.text doubleValue];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
