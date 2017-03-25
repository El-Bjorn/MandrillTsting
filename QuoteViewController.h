//
//  QuoteViewController.h
//  SchunkApp
//
//  Created by BjornC on 8/21/13.
//  Copyright (c) 2013 Dmitri Salcedo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NumericSchunkField.h"

@interface QuoteViewController : UIViewController <UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *quoteHeader;

// schunk logo
- (IBAction)schunkLogo:(id)sender;



- (IBAction)bringUpCameraView:(id)sender;
- (IBAction)dismissKeyboard:(id)sender;
- (IBAction)getQuote:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *nameField;

@property (strong, nonatomic) IBOutlet UITextField *applicationField;
@property (strong, nonatomic) IBOutlet UITextField *phoneNumberField;
@property (strong, nonatomic) IBOutlet UITextField *emailField;

@property (strong, nonatomic) IBOutlet NumericSchunkField *surfaceWidth;
@property (strong, nonatomic) IBOutlet NumericSchunkField *brushSurfaceArea;
@property (strong, nonatomic) IBOutlet NumericSchunkField *surfaceLengthField;

@property (strong, nonatomic) IBOutlet UIButton *cameraButton;
@property (strong, nonatomic) IBOutlet UIButton *quoteButton;

@end
