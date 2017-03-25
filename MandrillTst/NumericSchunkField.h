//
//  NumericSchunkField.h
//  SchunkApp
//
//  Created by BjornC on 8/27/13.
//  Copyright (c) 2013 Dmitri Salcedo. All rights reserved.
//

#import <UIKit/UIKit.h>

// I got sick of specifying the damn keyboard type
@interface NumericSchunkField : UITextField
-(double) numValue;
@end
