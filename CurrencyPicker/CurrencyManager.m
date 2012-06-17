//
//  CurrencyManager.m
//  CurrencyPicker
//
//  Created by Simon Fairbairn on 17/06/2012.
//  Copyright (c) 2012 Line In Web Design. All rights reserved.
//

#import "CurrencyManager.h"
#import "Currency.h"

@interface CurrencyManager() 

@property (strong, nonatomic) NSDictionary* currencyDictionary;

@end

@implementation CurrencyManager

@synthesize validCurrencies = _validCurrencies;
@synthesize currencyDictionary = _currencyDictionary;

// Don't return a mutable array
- (NSArray *)validCurrencies {
    return [_validCurrencies copy];
}


- (CurrencyManager *) init {
    self = [super init];
    if ( self ) {
        
        NSMutableDictionary* countryInfo = [[NSMutableDictionary alloc] init];
        NSMutableArray* keptCurrencies = [[NSMutableArray alloc] init];
        NSArray* countries = [NSLocale availableLocaleIdentifiers];
        
        for ( NSString* country in countries ) {
            // Initiate the country
            Currency* currency = [[Currency alloc] initWithLocaleIdentifier:country];
            if ( currency ) {
                [countryInfo setObject:currency forKey:currency.name];
                [keptCurrencies addObject:currency.name];
            }
            
        } 
        _validCurrencies = keptCurrencies;
        _currencyDictionary = countryInfo;
    }
    return self;
}

-(int)currencyCount {
    return self.validCurrencies.count;
}


-(NSString *)titleForPickerForRow:(NSInteger)row {
    
    Currency* currencyItem = [self.currencyDictionary objectForKey:[self.validCurrencies objectAtIndex:row]];
    return currencyItem.pickerTitle;
}
-(Currency *)infoForCurrencyAtRow:(NSInteger)row {
    return [self.currencyDictionary objectForKey:[self.validCurrencies objectAtIndex:row]];   
    
}
-(Currency *)infoForCurrencyWithName:(NSString *)name {
    return [self.currencyDictionary objectForKey:name];
}


@end
