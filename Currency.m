//
//  Currency.m
//  CurrencyPicker
//
//  Created by Simon Fairbairn on 14/06/2012.
//  Copyright (c) 2012 Line In Web Design. All rights reserved.
//

#import "Currency.h"

@interface Currency() 

@end

@implementation Currency

@synthesize name = _name;
@synthesize code = _code;
@synthesize symbol = _symbol;
@synthesize pickerTitle = _pickerTitle;
@synthesize countryCode = _countryCode;



-(id)initWithCountryCode:(NSString *)countryCode forLocale:(NSLocale *)country {
    
    self = [super init];
    if ( self ) {

        NSLocale* currentLocale = [NSLocale currentLocale];
        _name = [currentLocale displayNameForKey:NSLocaleCountryCode value:countryCode];
        _symbol = [country objectForKey:NSLocaleCurrencySymbol];
        _code = [country objectForKey:NSLocaleCurrencyCode];
        _pickerTitle = [NSString stringWithFormat:@"%@ %@: %@ (%@)", countryCode, self.name, self.symbol, self.code];          
    }
    return self;
    
}

-(id) initWithLocaleIdentifier:(NSString *)identifier {
    
    NSLocale *country = [[NSLocale alloc] initWithLocaleIdentifier:identifier];
    NSString *countryCode = [country objectForKey:NSLocaleCountryCode];

    if ( countryCode ) {
        return [self initWithCountryCode:countryCode forLocale:country];
        //  symbol and currency code
    } else {
        return nil;
    }
    
}

-(id) init {
    // Get user's current locale
    NSLocale* currentLocale = [NSLocale currentLocale];
    return [self initWithCountryCode:[currentLocale objectForKey:NSLocaleCountryCode] forLocale:currentLocale];
}

@end
