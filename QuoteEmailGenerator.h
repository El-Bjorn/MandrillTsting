//
//  QuoteEmailGenerator.h
//  MandrillTst
//
//  Created by BjornC on 1/29/14.
//  Copyright (c) 2014 BjornC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuoteEmailGenerator : NSObject

-(void) sendQuoteRequestToSchunkWithMsgDict:(NSDictionary*)msgDict;

@end
