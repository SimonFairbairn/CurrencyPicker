//
//  Currency.m
//  CurrencyPicker
//
//  Created by Simon Fairbairn on 14/06/2012.
//  Copyright (c) 2012 Line In Web Design. All rights reserved.
//

#import "Currency.h"

@interface Currency() 


@property (strong, nonatomic) NSArray* validCurrencies;
@property (strong, nonatomic) NSLocale* currentLocale;

@end

@implementation Currency

@synthesize validCurrencies = _validCurrencies;
@synthesize currentLocale = _currentLocale;

- (Currency *) init {
    self = [super init];
    if ( self ) {
        NSLocale* currentLocale = [NSLocale currentLocale];
        NSMutableArray* keptCurrencies = [[NSMutableArray alloc] init];        
        NSMutableDictionary* keptCountries = [[NSMutableDictionary alloc] init];
        NSArray* currencies = [NSLocale availableLocaleIdentifiers];
        
        for ( NSString* currency in currencies ) {
            // Initiate the country
            NSLocale *country = [[NSLocale alloc] initWithLocaleIdentifier:currency];
            NSString *countryCode = [country objectForKey:NSLocaleCountryCode];   

            // If the country is not null
            if ( countryCode ) {
                NSString *countryName = [currentLocale displayNameForKey:NSLocaleCountryCode value:countryCode];
                //  symbol and currency code
                NSString *localCurrencySymbol = [country objectForKey:NSLocaleCurrencySymbol];
                NSString *currencyCode = [country objectForKey:NSLocaleCurrencyCode];
                NSString *title = [NSString stringWithFormat:@"%@ %@: %@ (%@)", countryCode, countryName, localCurrencySymbol, currencyCode];
                
                
                NSDictionary* countryInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                             countryName, @"name",
                                             countryCode, @"countryCode", 
                                             title, @"pickerTitle",
                                             localCurrencySymbol, @"symbol",
                                             currencyCode, @"code",
                                             nil];
                              
                
                [keptCurrencies addObject:countryInfo];
            }
            
        } 
        NSLog(@"%@", keptCountries);
        NSLog(@"%@", keptCurrencies);
        _validCurrencies = keptCurrencies;
        _currentLocale = currentLocale;
        
    }
    return self;
}

-(int)currencyCount {
    return [self.validCurrencies count];
}


-(NSString *)titleForPickerForRow:(NSInteger)row {

    NSDictionary* item = [self.validCurrencies objectAtIndex:row];
    return [item valueForKey:@"pickerTitle"];
}
-(NSDictionary *)infoForCurrencyAtRow:(NSInteger)row {
    return [self.validCurrencies objectAtIndex:row];   
    
}



@end
