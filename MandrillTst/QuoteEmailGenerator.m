//
//  QuoteEmailGenerator.m
//  MandrillTst
//
//  Created by BjornC on 1/29/14.
//  Copyright (c) 2014 BjornC. All rights reserved.
//

#import "QuoteEmailGenerator.h"

@implementation QuoteEmailGenerator

-(void) sendQuoteRequestToSchunkWithMsgDict:(NSDictionary*)QuoteData {
    //__block NSError *jsonError = nil;
    //NSString *apiKey = @"LE3I1ine5EoYJ_hQZQXr_Q";
    NSString *emailURL = @"https://mandrillapp.com/api/1.0/messages/send.json";
    //NSString *pingURL = @"https://mandrillapp.com/api/1.0/users/ping.json";
    // JSON data for email msg
    NSMutableDictionary *emailDict = [[NSMutableDictionary alloc] init]; // toplevel
    NSMutableDictionary *msgDict = [[NSMutableDictionary alloc] init];
    //NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"redhead1" ofType:@"jpg"];
    UIImage *quoteImage = [UIImage imageNamed:@"redhead6.jpg"]; // 141K seems to be ok
    NSData *imageData = UIImagePNGRepresentation(quoteImage);
    NSString *imageDataStr = [imageData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithCarriageReturn];
    //NSDictionary *imageDict = @{@"type": @"image/png",
                        //      @"name": @"RHtst1",
                          // @"content": imageData };
    NSDictionary *imageDict = [NSDictionary dictionaryWithObjectsAndKeys:@"image/png",@"type",@"RHtst1",@"name",imageDataStr ,@"content", nil];
    // msgDict sub-parts
    //NSMutableArray *toAddress;
    //NSMutableDictionary *headers;
    // header sub-parts
    //NSMutableDictionary *replyTo;
    
    // build the email (toplevel)
    emailDict[@"key"] = @"LE3I1ine5EoYJ_hQZQXr_Q";
    emailDict[@"message"] = msgDict;
    // build the message section
    msgDict[@"subject"] = @"RH tst3 (testing max image size)";
    msgDict[@"from_email"] = @"message.from_email@example.com";
    msgDict[@"from_name"] = @"Schunk app quote request";
    msgDict[@"text"] = @"RH test 3";
    msgDict[@"to"] = @[ @{ @"email": @"jack@builtlight.org",
                      @"name": @"Me, doing schunk testing",
                      @"type": @"to" } ];
    msgDict[@"headers"] = @{ @"Reply-To": @"message.reply@example.com" };
    msgDict[@"attachments"] = @[ imageDict  ];
    
    NSLog(@"email content= %@",msgDict);
    // package up the json content into an nsdata
    __block NSError *jsonErr = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:emailDict options:0 error:&jsonErr];
    if (jsonErr) {
        NSLog(@"json encoding error");
    }
    NSString *jstr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSLog(@"jsonData = %@",jstr);
    
    // the emailing
    NSString *address = [NSString stringWithFormat:@"%@",emailURL];
    NSLog(@"sending to: %@",address);
    
    NSOperationQueue *networkQueue = [[NSOperationQueue alloc] init];
    NSMutableURLRequest *request  = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:address]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:jsonData];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];

    
    [NSURLConnection sendAsynchronousRequest:request queue:networkQueue completionHandler:^(NSURLResponse *resp, NSData *respData, NSError *err){
        NSDictionary *result;
        NSLog(@"response block, resp= %@",resp);
        if (respData) {
            result = [NSJSONSerialization JSONObjectWithData:respData options:NSJSONReadingAllowFragments error:&jsonErr];
            if (jsonErr) {
                NSLog(@"bad json decode:%@",jsonErr.localizedDescription);
            }
        } else if (err){
            NSLog(@"error: %@", err.localizedDescription);
        }
        /*if (result[@"errors"]) {
            NSLog(@"error resp: %@", result[@"errors"]);
        } */
    }];
    
}



-(void) sendJSONPOSTRequestToAddress:(NSString *)address
                            withData:(NSData *)paramData withCompletionHandler:(void (^)(NSURLResponse * response, NSData * responseData, NSError * error))completionHandler {
    NSOperationQueue *networkQueue = [[NSOperationQueue alloc] init];
    NSMutableURLRequest *request  = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:address]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:paramData];
    //  these fields seem unecessary
    //    NSString * postLength = [NSString stringWithFormat:@"%d", [paramData length]];
    //    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    if (request) {
        [NSURLConnection sendAsynchronousRequest:request queue:networkQueue completionHandler:completionHandler];
    }
}


@end
