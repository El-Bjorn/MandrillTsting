//
//  QuoteViewController.m
//  SchunkApp
//
//  Created by BjornC on 8/21/13.
//  Copyright (c) 2013 Dmitri Salcedo. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "QuoteViewController.h"
#import "QuoteEmailGenerator.h"

@interface QuoteViewController ()

@end

@implementation QuoteViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.quoteHeader.layer.borderWidth = 2.0;
    
    self.cameraButton.layer.cornerRadius = 8;
    self.quoteButton.layer.cornerRadius = 8;

    self.phoneNumberField.keyboardType = UIKeyboardTypePhonePad;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)schunkLogo:(id)sender {
    [self.navigationController.tabBarController dismissViewControllerAnimated:NO completion:^{}];            
    
}

- (IBAction)bringUpCameraView:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    [imagePicker setDelegate:self];
    [self presentModalViewController:imagePicker animated:YES];
    NSLog(@"Bring up the camera");
}

// touched view outside any text field
- (IBAction)dismissKeyboard:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)getQuote:(id)sender {
    NSLog(@"Send quote email (check if there's a picture");
    QuoteEmailGenerator *quoteGen = [[QuoteEmailGenerator alloc] init];
    [quoteGen sendQuoteRequestToSchunkWithMsgDict:nil];
    
}
- (void)viewDidUnload {
    [self setNameField:nil];
    [self setApplicationField:nil];
    [self setPhoneNumberField:nil];
    [self setEmailField:nil];
    [self setBrushSurfaceArea:nil];
    [self setSurfaceLengthField:nil];
    [self setSurfaceWidth:nil];
    [super viewDidUnload];
}
@end
