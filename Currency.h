//
//  Currency.h
//  CurrencyPicker
//
//  Created by Simon Fairbairn on 14/06/2012.
//  Copyright (c) 2012 Line In Web Design. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Currency : NSObject

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* code;
@property (strong, nonatomic) NSString* symbol;
@property (strong, nonatomic) NSString* countryCode;
@property (strong, nonatomic) NSString* pickerTitle;

-(id) initWithCountryCode:(NSString *)countryCode forLocale:(NSLocale *) country;
-(id) initWithLocaleIdentifier:(NSString *)identifier;
@end
